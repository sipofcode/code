require "minitest/autorun"
require "minitest/color"
require "./rpg"

class WeaponTest < Minitest::Test
  def test_without_weapon
    attacker = Character.new
    receiver = Character.new

    attacker.attack receiver
    assert_equal 90, receiver.health
    assert_equal 99, attacker.stamina
  end

  def test_with_short_weapon
    attacker = Character.new
    receiver = Character.new
    attacker.equip ShortWeapon.new

    attacker.attack receiver
    assert_equal 85, receiver.health
    assert_equal 95, attacker.stamina
  end

  def test_with_long_weapon
    attacker = Character.new
    receiver = Character.new
    attacker.equip LongWeapon.new

    attacker.attack receiver
    assert_equal 75, receiver.health
    assert_equal 90, attacker.stamina
  end
end
