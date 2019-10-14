class FundingRound
    attr_accessor :type
    attr_reader :startup, :venture_capitalist, :investment
    
    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        self.class.all << self
    end

    def investment=(investment)
        @investment = investment.to_f unless investment < 0
    end

    def self.all
        @@all
    end
end
