require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'
require 'pry'

class BattleshipTest < Minitest::Test
  def test_welcome_message
    skip
    game = Battleship.new
    expected = "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"

    assert_nil expected, game
  end

  def test_when_p_selected_computer_player_instantiated
    skip
    game = Battleship.new
    assert_instance_of Computer, game.computer_player
  end

  def test_when_p_selected_human_player_instantiated
    skip
    game = Battleship.new
    assert_instance_of Player, game.computer_player
  end

  def test_when_user_inputs_coordinates_gets_chomps_it
    skip
  end

end
