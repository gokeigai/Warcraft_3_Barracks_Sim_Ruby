# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit

  attr_reader :attack_power, :health_points

  def initialize
    @health_points = 60
    @attack_power = 10
  end

end
