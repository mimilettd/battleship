class GameGrid
  attr_reader :grid
  def initialize
    @grid = {:a1 => false, :a2 => false, :a3 => false, :a4 => false,
             :b1 => false, :b2 => false, :b3 => false, :b4 => false,
             :c1 => false, :c2 => false, :c3 => false, :c4 => false,
             :d1 => false, :d2 => false, :d3 => false, :d4 => false}
  end

  def ship_position(coord1, coord2, coord3=false)
    # Find key
    # Change value
    @grid[coord1] = true
    @grid[coord2] = true
    @grid[coord3] = true
  end

end
