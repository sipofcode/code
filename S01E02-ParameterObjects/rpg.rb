class Character
  attr_reader :weapon

  def initialize
    @lvl = @str = @dex = 1
  end

  def equip(weapon)
    if weapon.can_be_used_with?(@lvl, @str, @dex)
      @weapon = weapon
    end
  end
end

class Stats
  def initialize(lvl, str, dex)
    @lvl = lvl
    @str = str
    @dex = dex
  end
end

class Weapon
  def initialize(lvl, str, dex)
    @min_lvl = lvl
    @min_str = str
    @min_dex = dex
  end

  def can_be_used_with?(lvl, str, dex, stats = nil)
    lvl >= @min_lvl &&
    str >= @min_str &&
    dex >= @min_dex
  end
end

class Potion
  def initialize(lvl, str, dex)
    @min_lvl = lvl
    @max_str = str
    @min_dex = dex
  end

  def can_be_used_with?(lvl, str, dex)
    lvl >= @min_lvl &&
    str < @max_str &&
    dex >= @min_dex
  end
end
