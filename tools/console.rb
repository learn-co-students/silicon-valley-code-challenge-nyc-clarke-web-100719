require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

aviato = Startup.new("Aviato", "Erlich", "social media")
jimmy = VentureCapitalist.new("Jimmy Investments", 1000000001)
ppiper = Startup.new("Pied Piper", "Richard", "music")
spotify = Startup.new("Spotify", "Daniel", "music")
johnny = VentureCapitalist.new("Johnny Investments", 80000000)

contract1 = ppiper.sign_contract(jimmy, "Angel", 10000000)
contract2 = spotify.sign_contract(jimmy, "Angel", 10000001)
contract3 = ppiper.sign_contract(jimmy, "Series A", 100000000)
contract4 = johnny.offer_contract(aviato, "Series B", 100000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line