require 'minitest/autorun'
require 'minitest/pride'
require '../lib/battleship'
require 'pry'

class BattleshipTest < Minitest::Test
  def test_welcome_message
    battleship = Battleship.new
    expected = puts "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"

    assert_nil expected, battleship.welcome
  end

end
