require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test
  def test_class_exist
    human_player = Player.new
    assert_instance_of Player, human_player
  end

  def test_two_unit_ship_validation
    skip
    human_player = Player.new
    human_player.two_unit_ship_position("A1 A2")
    assert_equal true, human_player.human_player.grid["A1"][1]
    assert_equal true, human_player.human_player.grid["A2"][1]
  end

  def test_three_unit_ship_validation
    skip
    human_player = Player.new
    human_player.three_unit_ship_position("a1 a3")
    assert_equal true, human_player.grid["a1"][0]
    assert_equal true, human_player.grid["a3"][0]
  end

  def test_when_given_coordinates_false_switches_to_true
    game_grid = GameGrid.new
    skip
    game_grid.two_unit_ship_position("A1", "A2")
    assert_equal true, game_grid.grid["A1"]
    assert_equal true, game_grid.grid["A2"]
  end

  def test_false_if_coordinates_are_not_sequential
    skip
    game_grid = GameGrid.new
    game_grid.two_unit_ship_position("a1", "c1")
    assert_equal false, game_grid.grid["a1"]
    assert_equal false, game_grid.grid["c1"]
  end

  def test_false_if_coordinates_wrap_around_board
    skip
    game_grid = GameGrid.new
    game_grid.two_unit_ship_position("a4", "a1")
    assert_equal false, game_grid.grid["a4"]
    assert_equal false, game_grid.grid["a1"]
  end

  def test_three_unit_ship_validation
    skip
    game_grid = GameGrid.new
    game_grid.three_unit_ship_position("a1", "a3")
    assert_equal true, game_grid.grid["a1"]
    assert_equal true, game_grid.grid["a3"]
  end

  def test_three_unit_ship_invalid_coordinates
    skip
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
    skip
    game_grid = GameGrid.new
    game_grid.three_unit_ship_position("a1", "a3")
    assert_equal true, game_grid.grid["a1"]
    assert_equal true, game_grid.grid["a2"]
    assert_equal true, game_grid.grid["a3"]
  end

  def test_mid_cell_switch_to_true_if_three_unit_ship_laid_vertical
    skip
    game_grid = GameGrid.new
    game_grid.three_unit_ship_position("a1", "c1")
    assert_equal true, game_grid.grid["a1"]
    assert_equal true, game_grid.grid["b1"]
    assert_equal true, game_grid.grid["c1"]
  end

  def test_ships_cannot_overlap
    skip
    game_grid = GameGrid.new
    game_grid.two_unit_ship_position("a1", "a2")
    game_grid.three_unit_ship_position("a1", "c1")
    assert_equal true, game_grid.grid["a1"]
    assert_equal true, game_grid.grid["a2"]
    assert_equal false, game_grid.grid["b1"]
    assert_equal false, game_grid.grid["c1"]
  end

end
