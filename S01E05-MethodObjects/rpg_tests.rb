require "minitest/autorun"
require "minitest/color"
require "./rpg"

class AttackTest < Minitest::Test
  def test_basic_near_attack
    attacker = Character.new(Position.new(0, 0))
    receiver = Character.new(Position.new(1, 1))

    attacker.attack receiver
    assert_equal 89, receiver.health
  end

  def test_basic_far_attack
    attacker = Character.new(Position.new(0, 0))
    receiver = Character.new(Position.new(11, 0))

    attacker.attack receiver
    assert_equal 92.2, receiver.health
  end

  def test_basic_further_attack
    attacker = Character.new(Position.new(0, 0))
    receiver = Character.new(Position.new(40, 0))

    attacker.attack receiver
    assert_equal 98, receiver.health
  end

  def test_basic_furthest_attack
    attacker = Character.new(Position.new(0, 0))
    receiver = Character.new(Position.new(50, 0))

    attacker.attack receiver
    assert_equal 100, receiver.health
  end

  def test_basic_out_of_range_attack
    attacker = Character.new(Position.new(0, 0))
    receiver = Character.new(Position.new(51, 0))

    attacker.attack receiver
    assert_equal 100, receiver.health
  end
end
