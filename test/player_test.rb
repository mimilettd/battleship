require './lib/player'
require 'pry'

class PlayerTest < Minitest::Test
  def test_class_exist
    human_player = Player.new
    assert_instance_of Player, human_player
  end

  def test_when_human_player_instantiates_shot_starts_at_zero
    human_player = Player.new
    assert_equal 0, human_player.shot
  end

  def test_when_human_player_instantiates_lose_status_is_false
    human_player = Player.new
    assert_equal false, human_player.lose
  end

end
