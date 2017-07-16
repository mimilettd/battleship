require 'minitest/autorun'
require 'minitest/pride'
require '../lib/game_grid'
require 'pry'

class GameGridTest < Minitest::Test

  def test_class_exist
    grid = GameGrid.new
    assert_instance_of GameGrid, grid
  end

  def test_game_grid
    grid = GameGrid.new
    assert_equal "a1", grid.grid.keys[0]
    assert_equal "b1", grid.grid.keys[4]
    assert_equal "c1", grid.grid.keys[8]
    assert_equal "d1", grid.grid.keys[12]
  end

  def test_when_given_coordinates_false_switches_to_true
    game_grid = GameGrid.new
    game_grid.two_unit_ship_position("a1", "a2")
    assert_equal true, game_grid.grid["a1"]
    assert_equal true, game_grid.grid["a2"]
  end

  def test_false_if_coordinates_are_not_sequential
    game_grid = GameGrid.new
    game_grid.two_unit_ship_position("a1", "c1")
    assert_equal false, game_grid.grid["a1"]
    assert_equal false, game_grid.grid["c1"]
  end

  def test_false_if_coordinates_wrap_around_board
    game_grid = GameGrid.new
    game_grid.two_unit_ship_position("a4", "a1")
    assert_equal false, game_grid.grid["a4"]
    assert_equal false, game_grid.grid["a1"]
  end

  def test_three_unit_ship_validation
    game_grid = GameGrid.new
    game_grid.three_unit_ship_position("a1", "a3")
    assert_equal true, game_grid.grid["a1"]
    assert_equal true, game_grid.grid["a3"]
  end

  def test_three_unit_ship_invalid_coordinates
    game_grid = GameGrid.new
    game_grid.three_unit_ship_position("a1", "c3")
    assert_equal false, game_grid.grid["a1"]
    assert_equal false, game_grid.grid["c3"]

    game_grid = GameGrid.new
    game_grid.three_unit_ship_position("a4", "a2")
    assert_equal false, game_grid.grid["a4"]
    assert_equal false, game_grid.grid["c2"]
  end

  def test_mid_cell_switch_to_true_if_three_unit_ship_laid_horizontal
    game_grid = GameGrid.new
    game_grid.three_unit_ship_position("a1", "a3")
    assert_equal true, game_grid.grid["a1"]
    assert_equal true, game_grid.grid["a2"]
    assert_equal true, game_grid.grid["a3"]
  end

  def test_mid_cell_switch_to_true_if_three_unit_ship_laid_vertical
    game_grid = GameGrid.new
    game_grid.three_unit_ship_position("a1", "c1")
    assert_equal true, game_grid.grid["a1"]
    assert_equal true, game_grid.grid["b1"]
    assert_equal true, game_grid.grid["c1"]
  end

  def test_ships_cannot_overlap
    game_grid = GameGrid.new
    game_grid.two_unit_ship_position("a1", "a2")
    game_grid.three_unit_ship_position("a1", "c1")
    assert_equal true, game_grid.grid["a1"]
    assert_equal true, game_grid.grid["a2"]
    assert_equal false, game_grid.grid["b1"]
    assert_equal false, game_grid.grid["c1"]
  end

end
