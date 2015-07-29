class SiegeEngine < Unit

  attr_reader :health_points, :attack_power

  def initialize
    @health_points = 400
    @attack_power = 50
  end



  def attack!(target, points=@attack_power)

    if can_be_attacked?(target)
      
      ap = points
      
      if target.class.to_s == "Barracks"
        ap = @attack_power * 2
      end

      super(target, ap)

    else
      false
    end

  end

  def can_be_attacked?(enemy)

    if enemy.class.to_s == "Peasant" || enemy.class.to_s == "Footman"
      false
    else
      super(enemy)
    end
    
  end

end