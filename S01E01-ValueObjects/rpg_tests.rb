require "minitest/autorun"
require "minitest/color"
require "./rpg"

class CharacterTest < Minitest::Test
  def test_position_is_saved
    gimli = Character.new(0, 0)
    assert_equal 0, gimli.x
    assert_equal 0, gimli.y
  end

  def test_movement
    gimli = Character.new(0, 0)
    gimli.move(+1, +1)
    assert_equal 1, gimli.x
    assert_equal 1, gimli.y
  end

  def test_in_range
    gimli = Character.new(0, 0)
    legolas = Character.new(3, 3)
    assert gimli.in_range_with?(legolas)
  end

  def test_out_of_range
    gimli = Character.new(0, 0)
    legolas = Character.new(5, 5)
    refute gimli.in_range_with?(legolas)
  end
end
