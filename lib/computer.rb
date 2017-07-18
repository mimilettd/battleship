require_relative 'game_grid'

class Computer
  attr_reader :computer_player
  def initialize
    @computer_player = GameGrid.new
    find_first_two_unit_ship_coordinate
  end

  def find_first_two_unit_ship_coordinate
    coord1 = @computer_player.grid.to_a.sample(1).to_h.keys[0]
    @computer_player.grid[coord1] = true
    find_second_two_unit_ship_coordinate(coord1)
  end

  def find_second_two_unit_ship_coordinate(coord1)
    coord2_array = neighboring_coordinates_for_two_unit_ship[coord1]
    coord2 = coord2_array.sample(1)[0]
    @computer_player.grid[coord2] = true
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
    if @computer_player.grid[coord1] == true
      find_first_three_unit_ship_coordinate
    else
      @computer_player.grid[coord1] = true
      find_second_three_unit_ship_coordinate(coord1)
    end
  end

  def find_second_three_unit_ship_coordinate(coord1)
    coord2_array_sample = neighboring_coordinates_for_three_unit_ship[coord1]
    coord2_array = coord2_array_sample.sample(1)[0]
    coord2 = coord2_array[0]
    coord3 = coord2_array[1]
    @computer_player.grid[coord2] = true
    @computer_player.grid[coord3] = true
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



end
