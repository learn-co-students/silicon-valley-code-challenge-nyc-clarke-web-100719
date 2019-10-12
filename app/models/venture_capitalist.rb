class VentureCapitalist

    attr_accessor :name
    @@all =[]

    def self.all
        @@all
    end

    def initialize(name, net_worth)
        @name = name
        @net_worth = net_worth

        self.class.all << self

    end

    def total_worth
        @net_worth
    end

    def self.tres_commas_club
        all.select{|investor| investor.total_worth > 1000000000}
    end

    def offer_contract(startup, investment, type = "A1")
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select{|investment| investment.venture_capitalist == self }
    end

    def portfolio
        funding_rounds.map{|inv| inv.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max_by{|inv| inv.investment}
    end

    def invested(domain)
        funding_rounds.select{|inv| inv.startup.domain == domain}.map{|inv| inv.investment}.sum
    end
end
