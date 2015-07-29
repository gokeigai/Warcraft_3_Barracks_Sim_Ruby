require_relative 'spec_helper'

describe Barracks do 

  before :each do
    @barracks = Barracks.new
  end

  it "has and knows its lumber" do
    expect(@barracks.lumber).to eq(500)
  end

  describe "#damage" do
    it "should receive damage resulting in lower hp" do
      @barracks.damage(5)
      expect(@barracks.health_points).to eq(495)
    end
  end

  describe "#can_train_siege_engine?" do
    it "returns true if there are enough resources to train a footman" do
      # now check to see if one is trainable
      # can jump right to the test since barracks start off with enough gold and food to train multiple footmen
      expect(@barracks.can_train_siege_engine?).to be_truthy
    end

    it "returns false if there isn't enough food" do
      # Make the barracks believe it only has 2 food item left, even though it starts with 80
      # This is done by overwriting the `food` getter method
      @barracks.should_receive(:food).and_return(2)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough gold" do
      # Make the barracks believe it only has 199 gold left, even though it starts with 1000
      # This is done by overwriting the `gold` getter method
      @barracks.should_receive(:gold).and_return(199)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end

    it "returns false if there isn't enough lumber" do
      # Make the barracks believe it only has 59 lumber left, even though it starts with 500
      # This is done by overwriting the `lumber` getter method
      @barracks.should_receive(:lumber).and_return(59)
      expect(@barracks.can_train_siege_engine?).to be_falsey
    end
  end

  describe "#train_siege_engine" do

    it "costs 200 gold" do
      @barracks.train_siege_engine
      expect(@barracks.gold).to eq(800) # starts at 1000
    end

    it "costs 3 food" do
      @barracks.train_siege_engine
      expect(@barracks.food).to eq(77) # starts at 80
    end

    it "costs 60 lumber" do
      @barracks.train_siege_engine
      expect(@barracks.lumber).to eq(440) # starts at 500
    end

    it "produces a siege engine unit" do
      siege_engine = @barracks.train_siege_engine
      expect(siege_engine).to be_an_instance_of(SiegeEngine)
    end

  end
  
end

describe Unit do
  before :each do
    @unit = Unit.new(1,1)
    @enemy = Unit.new(1,2)
  end

  describe "#dead?" do
    it "should return true that the unit is dead" do
      @enemy.attack!(@unit)
      expect(@unit.dead?).to eq(true)
    end
  end

  describe "#can_attack?" do
    it "should return true that the unit is dead" do
      @enemy.attack!(@unit)
      expect(@unit.can_attack?).to eq(false)
    end
  end

  describe "#can_be_attacked?" do
    it "should return true that the unit is dead" do
      @unit.attack!(@enemy)
      expect(@unit.can_be_attacked?(@enemy)).to eq(false)
    end
  end

end


describe Footman do 

  before :each do
    @footman = Footman.new
  end

  describe "#attack" do
    it "attacks Barracks but only does half of its AP" do
      enemy = Barracks.new
      @footman.attack!(enemy)
      expect(enemy.health_points).to eq(495)
    end
  end

  it "should not attack the dead and return false" do
    enemy = Unit.new(1, 1)
    @footman.attack!(enemy)
    expect(@footman.attack!(enemy)).to eq(false)
  end
  
end

describe SiegeEngine do
  before :each do
    @siege = SiegeEngine.new
  end

  describe "#attack" do
  it "should not attack Peasant or Footman and should return false" do
    footman = Footman.new
    expect(@siege.attack!(footman)).to eq(false)
  end

    it "attacks Barracks but does double of its AP" do
      enemy = Barracks.new
      @siege.attack!(enemy)
      expect(enemy.health_points).to eq(400)
    end
  end
end