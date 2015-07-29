class Unit

  attr_reader :health_points, :attack_power

  def initialize(health, attack)
    @health_points = health
    @attack_power = attack
  end

  def damage(points)
    @health_points -= points
  end

  def attack!(target, points=@attack_power)
    if can_attack? && can_be_attacked?(target)
      target.damage(points)
    else
      false
    end
  end

  def dead?
    health_points <= 0
  end

  def can_attack?
    !dead?
  end

  def can_be_attacked?(enemy)
    !enemy.dead?
  end

end