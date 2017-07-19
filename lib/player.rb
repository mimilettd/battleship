require 'pry'

class Player
include StandardOutput
  attr_accessor :human_player
  def initialize
    @human_player = GameGrid.new
  end

  def two_unit_ship_position(coordinates)
    coord1 = coordinates[0]
    coord2 = coordinates[1]
    if @human_player.grid.has_key?(coord1)
      @human_player.grid[coord1][1] = true
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
    elsif coord1_ascii[0] + 1 == coord2_ascii[0] && coord1_ascii[1] == coord2_ascii[1]
      @human_player.grid[coord2][1] = true
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
      convert_horizontal_middle_cell(coord2_ascii)
    elsif coord1_ascii[0] + 2 == coord2_ascii[0] && coord1_ascii[1] == coord2_ascii[1]
      @human_player.grid[coord2][1] = true
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
  end



end
