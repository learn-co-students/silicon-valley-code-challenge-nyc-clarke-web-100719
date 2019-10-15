class FundingRound

attr_accessor :startup
attr_reader :venturecapitalist
@@all = []
    def initialize(startup,venturecapitalist)
        @startup = startup
        @venturecapitalist = venturecapitalist
        @@all << self
    end

    def self.all
        @@all
    end

    def type
        self.class.all.each do |funding|
        if funding.venturecapitalist.total_worth == 100000000000
            return "Serie C"
        elsif funding.venturecapitalist.total_worth > 1000000000 && funding.venturecapitalist.total_worth < 1000000000000
            return "Serie B"
        else
            return "Serie A"
        end
    end
    end

    def investment
     self.venturecapitalist.total_worth.to_f
    end

end
