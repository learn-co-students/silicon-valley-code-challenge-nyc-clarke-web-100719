require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

capitalist1 =  VentureCapitalist.new("SJ", 15000000000)
capitalist2 =  VentureCapitalist.new("MZ", 100000000)
capitalist3 =  VentureCapitalist.new("JP", 150000000)
capitalist4 =  VentureCapitalist.new("BG", 2000000000)

st1 = Startup.new("Tap","Alex","O1")
st2 = Startup.new("Here","Rian","O1")
st3 = Startup.new("Up","Mike","X1")
st4 = Startup.new("Cap","Chris","X5")
st5 = Startup.new("Loop","Al","P4")

investment1 = FundingRound.new(st1, capitalist1, "A1",1000000)
investment2 = FundingRound.new(st2, capitalist1, "A1",7000000)
investment3 = FundingRound.new(st1, capitalist3, "A1",1000000)
investment4 = FundingRound.new(st3, capitalist2, "A1",5000000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line