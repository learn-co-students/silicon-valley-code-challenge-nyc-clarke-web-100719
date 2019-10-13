require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
startup1 = Startup.new("snap", "joe", "douchealley")
startup2 = Startup.new("insta", "chris", "d-ville")

vc1 = VentureCapitalist.new("alex", 1000000001.0)
vc2 = VentureCapitalist.new("pig", 90000000000.0)

fr1 = FundingRound.new(startup1, vc1, "Angel", 100.0)
fr2 = FundingRound.new(startup1, vc1, "Seed", 1000.0)
fr3 = FundingRound.new(startup1, vc2, "Angel", 10000.0)
fr4 = FundingRound.new(startup2, vc2, "Seed", 9000.0)



binding.pry
0 #leave this here to ensure binding.pry isn't the last line