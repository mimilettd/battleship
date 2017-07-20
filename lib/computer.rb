require_relative 'standard_output'
require_relative 'game_grid'

class Computer
include StandardOutput
  attr_reader   :computer_player,
                :ship_1,
                :ship_2
  attr_accessor :shot,
                :lose
  def initialize
    @computer_player = GameGrid.new
    @shot = 0
    @lose = false
    find_first_two_unit_ship_coordinate
  end

  def find_first_two_unit_ship_coordinate
    coord1 = @computer_player.grid.to_a.sample(1).to_h.keys[0]
    @computer_player.grid[coord1][1] = true
    @ship_1 = @computer_player.create_new_ship
    @ship_1.space_1(coord1)
    find_second_two_unit_ship_coordinate(coord1)
  end

  def find_second_two_unit_ship_coordinate(coord1)
    coord2_array = neighboring_coordinates_for_two_unit_ship[coord1]
    coord2 = coord2_array.sample(1)[0]
    @computer_player.grid[coord2][1] = true
    @ship_1.space_2(coord2)
    find_first_three_unit_ship_coordinate
  end

  def neighboring_coordinates_for_two_unit_ship
      { "A1" => ["A2", "B1"],
        "A2"=>["A1","A3","B2"],
        "A3"=>["A2","A4","B3"],
        "A4"=>["B4","A3"],
        "B1"=>["B2","A1","C1"],
        "B2"=>["B1","B3","A2","C2"],
        "B3"=>["A3","B2","B4","C3"],
        "B4"=>["A4","B3","C4"],
        "C1"=>["B1","C2","D1"],
        "C2"=>["C1","C3","B2","D2"],
        "C3"=>["B3","C2","C4","D3"],
        "C4"=>["B4","C3","D4"],
        "D1"=>["C1","D2"],
        "D2"=>["D1","D3","C2"],
        "D3"=>["C3","D2","D4"],
        "D4"=>["C4","D3"] }
  end

  def find_first_three_unit_ship_coordinate
    coord1 = @computer_player.grid.to_a.sample(1).to_h.keys[0]
    if @computer_player.grid[coord1][1] == true
      find_first_three_unit_ship_coordinate
    else
      @computer_player.grid[coord1][1] = true
      @ship_2 = @computer_player.create_new_ship
      @ship_2.space_1(coord1)
      find_second_three_unit_ship_coordinate(coord1)
    end
  end

  def find_second_three_unit_ship_coordinate(coord1)
    coord2_array_sample = neighboring_coordinates_for_three_unit_ship[coord1]
    coord2_array = coord2_array_sample.sample(1)[0]
    coord2 = coord2_array[0]
    coord3 = coord2_array[1]
    @computer_player.grid[coord2][1] = true
    @ship_2.space_2(coord2)
    @computer_player.grid[coord3][1] = true
    @ship_2.space_3(coord3)
  end

  def neighboring_coordinates_for_three_unit_ship
      { "A1"=>[["A2","A3"],["B1","C1"]],
        "A2"=>[["A1","A3"],["B2","C2"]],
        "A3"=>[["A2","A4"],["B3","C3"]],
        "A4"=>[["A2","A3"],["B4","C4"]],
        "B1"=>[["A1","C1"],["B2","B3"]],
        "B2"=>[["B1","B3"],["A2","C2"]],
        "B3"=>[["B2","B4"],["A3","C3"]],
        "B4"=>[["B2","B3"],["A4","C4"]],
        "C1"=>[["B1","D1"],["C2","C3"]],
        "C2"=>[["B2","D2"],["C1","C3"]],
        "C3"=>[["B3","D3"],["C2","C4"]],
        "C4"=>[["B4","D4"],["C2","C3"]],
        "D1"=>[["B1","C1"],["D2","D3"]],
        "D2"=>[["D1","D3"],["B2","C2"]],
        "D3"=>[["D2","D4"],["C3","B3"]],
        "D4"=>[["B4","C4"],["D2","D3"]] }
  end

  def match_player_shot_with_key(shot_selection)
    @shot += 1
    if @computer_player.grid[shot_selection][1] == true
      @computer_player.grid[shot_selection][0] = "  H  "
      you_hit
      @computer_player.print_game_board
      ship_hit(shot_selection)
    else
      @computer_player.grid[shot_selection][0] = "  M  "
      you_missed
      @computer_player.print_game_board
    end
  end

  def ship_hit(shot_selection)
    if @ship_1.fore == shot_selection || @ship_1.hull == shot_selection || @ship_1.aft == shot_selection
      @ship_1.damaged
      if @ship_1.sunk == true
        you_sank_my_two_unit_ship
      end
    elsif @ship_2.fore == shot_selection || @ship_2.hull == shot_selection || @ship_2.aft == shot_selection
      @ship_2.damaged
      if @ship_2.sunk == true
        you_sank_my_three_unit_ship
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
