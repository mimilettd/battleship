require_relative 'standard_output'
require_relative 'game_grid'
require 'pry'

class Player
include StandardOutput
  attr_reader   :ship_1,
                :ship_2,
                :human_player
  attr_accessor :shot,
                :lose
  def initialize
    @human_player = GameGrid.new
    @shot = 0
    @lose = false
  end

  def two_unit_ship_position(coordinates)
    coord1 = coordinates[0]
    coord2 = coordinates[1]
    if @human_player.grid.has_key?(coord1)
      @human_player.grid[coord1][1] = true
      @ship_1 = @human_player.create_new_ship
      @ship_1.space_1(coord1)
    end
    validating_two_unit_ship_position(coord1, coord2)
  end

  def validating_two_unit_ship_position(coord1, coord2)
    coord1_ascii = coord1.chars.map do |n|
      n.ord
    end
    coord2_ascii = coord2.chars.map do |n|
      n.ord
    end
    if coord1_ascii[0] == coord2_ascii[0] && coord1_ascii[1] + 1 == coord2_ascii[1]
      @human_player.grid[coord2][1] = true
      @ship_1.space_2(coord2)
    elsif coord1_ascii[0] + 1 == coord2_ascii[0] && coord1_ascii[1] == coord2_ascii[1]
      @human_player.grid[coord2][1] = true
      @ship_1.space_2(coord2)
    else
      @human_player.grid[coord1][1] = false
      incorrect_ship_placement_for_two_unit_ship
      user_input = gets.chomp
      split_user_input = user_input.split(" ")
      two_unit_ship_position(split_user_input)
    end
  end

  def three_unit_ship_position(coordinates)
    coord1 = coordinates[0]
    coord2 = coordinates[1]
    if @human_player.grid.has_key?(coord1) && @human_player.grid[coord1][1] == false
      @human_player.grid[coord1][1] = true
      @ship_2 = @human_player.create_new_ship
      @ship_2.space_1(coord1)
      validating_overlap(coord1, coord2)
    else
    incorrect_ship_placement_for_three_unit_ship
    user_input = gets.chomp
    split_user_input = user_input.split(" ")
    three_unit_ship_position(split_user_input)
    end
  end

  def validating_overlap(coord1, coord2)
    if @human_player.grid[coord2][1] == false
      validating_start_and_end(coord1, coord2)
    end
  end

  def validating_start_and_end(coord1, coord2)
    coord1_ascii = coord1.chars.map do |n|
      n.ord
    end
    coord2_ascii = coord2.chars.map do |n|
      n.ord
    end
    if coord1_ascii[0] == coord2_ascii[0] && coord1_ascii[1] + 2 == coord2_ascii[1]
      @human_player.grid[coord2][1] = true
      @ship_2.space_3(coord2)
      convert_horizontal_middle_cell(coord2_ascii)
    elsif coord1_ascii[0] + 2 == coord2_ascii[0] && coord1_ascii[1] == coord2_ascii[1]
      @human_player.grid[coord2][1] = true
      @ship_2.space_3(coord2)
      convert_vertical_middle_cell(coord2_ascii)
    else
      @human_player.grid[coord1][1] = false
      incorrect_ship_placement_for_three_unit_ship
      user_input = gets.chomp
      split_user_input = user_input.split(" ")
      three_unit_ship_position(split_user_input)
    end
  end

  def convert_horizontal_middle_cell(coord2_ascii)
    coord3_ascii = []
    coord3_ascii << coord2_ascii[0]
    coord3_ascii << coord2_ascii[1] - 1
    coord3_char = coord3_ascii.map do |character|
      character.chr
    end
    coord3 = coord3_char.join
    @human_player.grid[coord3][1] = true
    @ship_2.space_2(coord3)

  end

  def convert_vertical_middle_cell(coord2_ascii)
    coord3_ascii = []
    coord3_ascii << coord2_ascii[0] - 1
    coord3_ascii << coord2_ascii[1]
    coord3_char = coord3_ascii.map do |character|
      character.chr
    end
    coord3 = coord3_char.join
    @human_player.grid[coord3][1] = true
    @ship_2.space_2(coord3)

  end

  def verify_coordinate
    shot_selection = @human_player.grid.to_a.sample(1).to_h.keys[0]
    if @human_player.grid[shot_selection][0] == "  H  " || @human_player.grid[shot_selection][0] == "  M  "
      verify_coordinate unless @human_player.grid[shot_selection][0] != "  H  " || @human_player.grid[shot_selection][0] != "  M  "
    else
      match_computer_shot_with_key(shot_selection)
    end
  end

  def match_computer_shot_with_key(shot_selection)
    if @human_player.grid[shot_selection][1] == true
      @human_player.grid[shot_selection][0] = "  H  "
      i_hit
      @shot += 1
      ship_hit(shot_selection)
    else
      @human_player.grid[shot_selection][0] = "  M  "
      i_missed
      @shot += 1
    end
  end

  def ship_hit(shot_selection)
    if @ship_1.fore == shot_selection || @ship_1.hull == shot_selection || @ship_1.aft == shot_selection
      @ship_1.damaged
      if @ship_1.sunk == true
        i_sank_your_two_unit_ship
      end
    elsif @ship_2.fore == shot_selection || @ship_2.hull == shot_selection || @ship_2.aft == shot_selection
      @ship_2.damaged
      if @ship_2.sunk == true
        i_sank_your_three_unit_ship
      end
    end
    lose?
  end

  def lose?
    if @ship_1.sunk == true && @ship_2.sunk == true
      @lose = true
    end
  end


end
