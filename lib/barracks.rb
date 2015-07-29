class Barracks

  attr_accessor :gold, :food, :lumber, :health_points

  def initialize
    @gold = 1000
    @food = 80
    @lumber = 500
    @health_points = 500
  end
  
  def can_train_footman?
    gold > 135 && food > 2
  end

  def train_footman
    if can_train_footman?
      @gold -= 135
      @food -= 2
      new_footman = Footman.new
    end
  end

  def can_train_peasant?
    gold > 90 && food > 5
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      new_peasant = Peasant.new
    end
  end

  def can_train_siege_engine?
    gold > 200 && food > 3 && lumber > 60
  end

  def train_siege_engine
    if can_train_siege_engine?
      @gold -= 200
      @food -= 3
      @lumber -= 60
      siege_engine = SiegeEngine.new
    end
  end

  def damage(points)
    @health_points -= points
  end

  def dead?
    health_points <= 0
  end

end
