require 'minitest/autorun'
require 'minitest/pride'
require '../lib/game_grid'
require 'pry'

class GameGridTest < Minitest::Test

  def test_class_exist
    grid = GameGrid.new
    assert_instance_of GameGrid, grid
  end

  def test_grid
    grid = GameGrid.new
    assert_equal "a1", grid.grid.keys[0]
    assert_equal "b1", grid.grid.keys[4]
    assert_equal "c1", grid.grid.keys[8]
    assert_equal "d1", grid.grid.keys[12]
  end

  def test_can_change_coordinates_to_occupied
    game_grid = GameGrid.new
    game_grid.ship_position("a1", "a2")
    assert_equal true, game_grid.grid["a1"]
    assert_equal true, game_grid.grid["a2"]
  end

  def test_false_if_coordinates_are_not_sequential
    game_grid = GameGrid.new
    game_grid.ship_position("a1", "c1")
    assert_equal true, game_grid.grid["a1"]
    assert_equal false, game_grid.grid["c1"]
  end

end
