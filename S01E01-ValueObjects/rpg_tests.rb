require "minitest/autorun"
require "minitest/color"
require "./rpg"

class CharacterTest < Minitest::Test
  def test_position_is_saved
    gimli = Character.new(Position.new(0, 0))
    assert_equal Position.new(0, 0), gimli.position
  end

  def test_movement
    gimli = Character.new(Position.new(0, 0))
    gimli.move(+1, +1)
    assert_equal Position.new(1, 1), gimli.position
  end

  def test_in_range
    gimli = Character.new(Position.new(0, 0))
    legolas = Character.new(Position.new(3, 3))
    assert gimli.in_range_with?(legolas)
  end

  def test_out_of_range
    gimli = Character.new(Position.new(0, 0))
    legolas = Character.new(Position.new(5, 5))
    refute gimli.in_range_with?(legolas)
  end
end
