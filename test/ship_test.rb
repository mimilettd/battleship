require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require './lib/ship'
require 'pry'

class ShipTest < Minitest::Test
  def test_class_exist
    ship = Ship.new
    assert_instance_of Ship, ship
  end

  def test_ship_length_starts_at_zero
    ship = Ship.new
    assert_equal 0, ship.length
  end

  def test_ship_starts_with_false_sunk_status
    ship = Ship.new
    assert_equal false, ship.sunk
  end

  def test_when_intialized_fore_is_null
    ship = Ship.new
    assert_nil ship.fore
  end

  def test_when_intialized_hull_is_null
    ship = Ship.new
    assert_nil ship.hull
  end

  def test_when_intialized_aft_is_null
    ship = Ship.new
    assert_nil ship.aft
  end

  def test_when_one_space_given_length_increases_by_1
    ship_1 = Ship.new
    ship_1.space_1("a1")
    assert_equal 1, ship_1.length
  end

  def test_when_two_space_given_length_increases_by_2
    ship_1 = Ship.new
    ship_1.space_1("a1")
    ship_1.space_2("a2")
    assert_equal 2, ship_1.length
  end

  def test_three_unit_ship_can_increase_length_to_3
    ship_2 = Ship.new
    ship_2.space_1("a1")
    ship_2.space_2("a2")
    ship_2.space_3("a3")
    assert_equal 3, ship_2.length
  end

  def test_when_ship_damaged_it_increments_by_1
    skip
    ship_1 = Ship.new
    ship_1.damaged
    assert_equal 1, ship_1.damaged
  end

end
