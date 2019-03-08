class Position
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def move(dx, dy)
    @x += dx
    @y += dy
  end
end

class Character
  def initialize(x, y)
    @position = Position.new(x, y)
  end

  def x
    @position.x
  end

  def y
    @position.y
  end

  def move(dx, dy)
    @position.move(dx, dy)
  end

  def in_range_with?(other)
    Math.sqrt((other.x - @position.x) ** 2 +
              (other.y - @position.y) ** 2) < 5
  end
end
