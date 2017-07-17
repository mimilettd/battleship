require 'pry'

class GameGrid
  attr_accessor :grid
  def initialize
    @grid = {"A1" => false, "A2" => false, "A3" => false, "A4" => false,
             "B1" => false, "B2" => false, "B3" => false, "B4" => false,
             "C1" => false, "C2" => false, "C3" => false, "C4" => false,
             "D1" => false, "D2" => false, "D3" => false, "D4" => false}
  end

  def two_unit_ship_position(coord1, coord2)
    if @grid.has_key?(coord1)
      @grid[coord1] = true
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
      @grid[coord2] = true
    elsif coord1_ascii[0] + 1 == coord2_ascii[0] && coord1_ascii[1] == coord2_ascii[1]
      @grid[coord2] = true
    else
      puts "Incorrect ship placement. Please enter the squares for the two-unit ship again."
      @grid[coord1] = false
    end
  end

  def three_unit_ship_position(coord1, coord2)
    if @grid.has_key?(coord1) && @grid[coord1] == false
      @grid[coord1] = true
      validating_overlap(coord1, coord2)
    else
    puts "Ships cannot overlap. Please enter your coordinates again."
    end
  end

  def validating_overlap(coord1, coord2)
    if @grid[coord2] == false
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
      @grid[coord2] = true
      convert_horizontal_middle_cell(coord2_ascii)
    elsif coord1_ascii[0] + 2 == coord2_ascii[0] && coord1_ascii[1] == coord2_ascii[1]
      @grid[coord2] = true
      convert_vertical_middle_cell(coord2_ascii)
    else
      puts "Incorrect ship placement. Please enter the squares for the three-unit ship again."
      @grid[coord1] = false
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
    @grid[coord3] = true
  end

  def convert_vertical_middle_cell(coord2_ascii)
    coord3_ascii = []
    coord3_ascii << coord2_ascii[0] - 1
    coord3_ascii << coord2_ascii[1]
    coord3_char = coord3_ascii.map do |character|
      character.chr
    end
    coord3 = coord3_char.join
    @grid[coord3] = true
  end

end
