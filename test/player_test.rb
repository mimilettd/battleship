require 'minitest/autorun'
require 'minitest/pride'
require '../lib/player'
require 'pry'

class PlayerTest < Minitest::Test
  def test_class_exist
    computer = Computer.new
    assert_instance_of Computer, computer
  end
end
