class Character
  attr_reader :weapon, :stamina, :health

  def initialize
    @str = 10
    @stamina = @health = 100
    @weapon = NoWeapon.new
  end

  def apply_damage damage
    @health = [@health - damage, 0].max
  end

  def attack other
    damage = @str * @weapon.attack_multiplier
    stamina_impact = @weapon.stamina_impact
    other.apply_damage damage
    @stamina = [@stamina - stamina_impact, 0].max
  end

  def equip weapon
    @weapon = weapon
  end

  def unequip
    @weapon = NoWeapon.new
  end
end

class NoWeapon
  def attack_multiplier
    1
  end

  def stamina_impact
    1
  end
end

class ShortWeapon
  def attack_multiplier
    1.5
  end

  def stamina_impact
    5
  end
end

class LongWeapon
  def attack_multiplier
    2.5
  end

  def stamina_impact
    10
  end
end
