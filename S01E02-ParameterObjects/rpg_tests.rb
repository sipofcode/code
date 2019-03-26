require "minitest/autorun"
require "minitest/color"
require "./rpg"

class WeaponTest < Minitest::Test
  def test_can_equip
    weapon = Weapon.new(10, 100, 100)
    stats = Stats.new(10, nil, nil)
    assert weapon.can_be_used_with?(10, 100, 100, stats)
  end

  def test_cannot_equip_low_level
    weapon = Weapon.new(10, 100, 100)
    stats = Stats.new(9, nil, nil)
    refute weapon.can_be_used_with?(9, 100, 100, stats)
  end

  def test_cannot_equip_low_strength
    weapon = Weapon.new(10, 100, 100)
    stats = Stats.new(10, nil, nil)
    refute weapon.can_be_used_with?(10, 99, 100, stats)
  end

  def test_cannot_equip_low_dexterity
    weapon = Weapon.new(10, 100, 100)
    stats = Stats.new(10, nil, nil)
    refute weapon.can_be_used_with?(10, 100, 99, stats)
  end
end

class CharacterTest < Minitest::Test
  def test_weak_character_cannot_equip
    weapon = Weapon.new(10, 100, 100)
    character = Character.new
    character.equip(weapon)

    assert_nil character.weapon
  end

  class StrongCharacter < Character
    def initialize
      @lvl = 10
      @str = 100
      @dex = 100
    end
  end

  def test_strong_character_can_equip
    weapon = Weapon.new(10, 100, 100)
    character = StrongCharacter.new
    character.equip(weapon)

    refute_nil character.weapon
    assert_equal weapon, character.weapon
  end
end
