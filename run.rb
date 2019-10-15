require "pry"
require_relative "./app/models/startup.rb"
require_relative "./app/models/venture_capitalist.rb"
require_relative "./app/models/funding_round.rb"


startup1 = Startup.new("Goodaddy", "Adam", "www.Goodaddy.com")
startup2 = Startup.new("Namecheap", "thomas", "www.Namecheap.com")
startup3 = Startup.new("Bluehost", "alex", "www.Bluehost.com")
startup4 = Startup.new("HostGator", "Adam", "www.HostGator.com")



capitalist1 = VentureCapitalist.new("Soufiane", 2000000000)
capitalist2 = VentureCapitalist.new("yassine", 100000000)
capitalist3 = VentureCapitalist.new("meag", 15000000000)
capitalist4 = VentureCapitalist.new("ayman", 2000000000)


funding1 = FundingRound.new(startup1, capitalist3)
funding2 = FundingRound.new(startup2, capitalist1)
funding3 = FundingRound.new(startup1, capitalist2)
funding4 = FundingRound.new(startup4, capitalist4)
 
 

binding.pry 
0