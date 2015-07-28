class Peasant < Unit

  attr_reader :attack_power, :health_points

  def initialize
    @health_points = 35
    @attack_power = 0
  end

end