require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/battleship'
require 'pry'

class BattleshipTest < Minitest::Test
  def test_class_exist
    game = Battleship.new
    assert_instance_of Battleship, game
  end

end
