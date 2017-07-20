require './lib/game_grid'
require 'pry'

class GameGridTest < Minitest::Test

  def test_class_exist
    grid = GameGrid.new
    assert_instance_of GameGrid, grid
  end

  def test_game_grid_keys
    grid = GameGrid.new
    assert_equal "A1", grid.grid.keys[0]
    assert_equal "B1", grid.grid.keys[4]
    assert_equal "C1", grid.grid.keys[8]
    assert_equal "D1", grid.grid.keys[12]
  end

  def test_game_grid_values
    grid = GameGrid.new
    assert_equal ["     ", false], grid.grid.values[0]
    assert_equal ["     ", false], grid.grid.values[4]
    assert_equal ["     ", false], grid.grid.values[8]
    assert_equal ["     ", false], grid.grid.values[12]
  end

  def test_grid_can_create_new_ship
    grid = GameGrid.new
    ship_1 = grid.create_new_ship
    assert_instance_of Ship, ship_1
  end


end
