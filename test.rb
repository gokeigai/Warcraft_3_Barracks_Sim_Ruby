require './lib/unit.rb'
require './lib/barracks.rb'
require './lib/siege_engine.rb'
require './lib/footman.rb'

b = Barracks.new
f = Footman.new

b.train_siege_engine
puts b.food
