require 'pry'

class GameGrid
  attr_reader :grid
  def initialize
    @grid = {"a1" => false, "a2" => false, "a3" => false, "a4" => false,
             "b1" => false, "b2" => false, "b3" => false, "b4" => false,
             "c1" => false, "c2" => false, "c3" => false, "c4" => false,
             "d1" => false, "d2" => false, "d3" => false, "d4" => false}
  end

  def two_unit_ship_position(coord1, coord2)
    if @grid.has_key?(coord1)
      @grid[coord1] = true
    end
    validating_two_unit_ship(coord1, coord2)
  end

  def validating_two_unit_ship(coord1, coord2)
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
      puts "Ships can only be laid either horizontally or vertically! Please enter the squares for the two-unit ship again."
      @grid[coord1] = false
    end
  end


end
