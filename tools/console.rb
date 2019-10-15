require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

##startup 

startup1 = Startup.new("Goodaddy", "Adam flex", "www.Goodaddy.com")
startup2 = Startup.new("Namecheap", "thomas", "www.Namecheap.com")
startup3 = Startup.new("Bluehost", "alex", "www.Bluehost.com")
startup4 = Startup.new("HostGator", "mathiew", "www.HostGator.com")



binding.pry
0 #leave this here to ensure binding.pry isn't the last line