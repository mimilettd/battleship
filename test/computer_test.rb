require 'minitest/autorun'
require 'minitest/pride'
require '../lib/computer'
require 'pry'

class ComputerTest < Minitest::Test
  def test_class_exist
    computer = Computer.new
    assert_instance_of Computer, computer
  end

  def test_initializes_with_game_grid
    computer = Computer.new
    assert_instance_of GameGrid, computer.computer_player
  end

  def test_computer_selects_first_coordinate_and_returns_true
    computer = Computer.new
    assert true, computer.find_first_two_unit_ship_coordinate
  end

  def test_computer_selects_second_coordinate_and_returns_true
    computer = Computer.new
    coord1 = computer.computer_player.grid.to_a.sample(1).to_h.keys[0]
    assert true, computer.find_second_two_unit_ship_coordinate(coord1)
  end

end
