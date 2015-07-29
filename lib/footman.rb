# http://classic.battle.net/war3/human/units/footman.shtml

class Footman < Unit

  attr_reader :attack_power, :health_points

  def initialize
    @health_points = 60
    @attack_power = 10
  end

  def attack!(target, points=@attack_power)
    ap = points
    
    if target.class.to_s == "Barracks"
      ap = (@attack_power / 2).ceil
    end

    super(target, ap)
  end
end
