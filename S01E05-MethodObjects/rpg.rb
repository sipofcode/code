class Character

  BASE_DAMAGE = 10

  attr_reader :position, :breed, :health

  def initialize(position)
    @position = position
    @weapon = NullWeapon.new
    @breed = DefaultBreed.new
    @health = 100
    @berserker_mode = false
  end

  def attack(other)
    AttackCharacter.new(self, BASE_DAMAGE, @berserker_mode, @weapon, other).call
  end

  def apply_damage(damage)
    @health -= damage
  end
end

class AttackCharacter
  def initialize(attacker, initial_damage, berserker_mode, weapon, attacked)
    @attacker = attacker
    @damage = initial_damage
    @attacked = attacked
    @berserker_mode = berserker_mode
    @weapon = weapon
  end

  def call
    by_distance
    by_berserker_mode
    by_weapon
    by_breed
    apply_damage
  end

  private

  def by_distance
    distance = @attacker.position.distance_to(@attacked.position)
    if distance.between?(0, 10)
      @damage *= 1.1
    elsif distance.between?(10, 50)
      @damage *= 1 - (distance / 50)
    else
      @damage = 0
    end
  end

  def by_berserker_mode
    @damage += 0.1 if @berserker_mode
  end

  def by_weapon
    @damage *= @weapon.attack_multiplier
  end

  def by_breed
    @damage *= 2 if @attacker.breed.dominates?(@attacked.breed)
  end

  def apply_damage
    @attacked.apply_damage(@damage)
  end
end

class Position
  attr_reader :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end
  def distance_to(there)
    Math.sqrt((there.x - @x) ** 2 + (there.y - @y) ** 2)
  end
end

class NullWeapon
  def attack_multiplier
    1
  end
end

class DefaultBreed
  def dominates?(other)
    false
  end
end