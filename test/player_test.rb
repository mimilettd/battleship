require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test
  def test_class_exist
    human_player = Player.new
    assert_instance_of Player, human_player
  end

  def test_three_unit_ship_validation
    skip
    human_player = Player.new
    human_player.three_unit_ship_position("a1 a3")
    assert_equal true, human_player.grid["a1"][0]
    assert_equal true, human_player.grid["a3"][0]
  end

end
