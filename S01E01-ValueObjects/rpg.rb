class Character
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def move(dx, dy)
    @x += dx
    @y += dy
  end

  def in_range_with?(other)
    Math.sqrt((other.x - @x) ** 2 +
              (other.y - @y) ** 2) < 5
  end
end
