class Unit

  attr_reader :health_points, :attack_power

  def initialize(health, attack)
    @health_points = health
    @attack_power = attack
    self.freeze
  end

end