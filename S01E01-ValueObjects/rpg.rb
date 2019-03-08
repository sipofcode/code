class Position
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def move(dx, dy)
    Position.new(@x + dx, @y + dy)
  end

  def distance_to(there)
    Math.sqrt((there.x - @x) ** 2 + (there.y - @y) ** 2)
  end

  def ==(other)
    @x == other.x && @y == other.y
  end
end

class Character
  attr_reader :position

  def initialize(position)
    @position = position
  end

  def move(dx, dy)
    @position = @position.move(dx, dy)
  end

  def in_range_with?(other)
    @position.distance_to(other.position) < 5
  end
end
