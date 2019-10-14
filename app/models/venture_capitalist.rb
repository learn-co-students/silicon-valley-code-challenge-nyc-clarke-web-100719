class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        self.class.all << self
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select { |funding_round| funding_round.venture_capitalist == self }
    end

    def portfolio
        funding_rounds.map { |funding_round| funding_round.startup }.uniq
    end

    def biggest_investment
        funding_rounds.max_by { |funding_round| funding_round.investment }
    end

    def invested(domain)
        funding_rounds.reduce(0) do |total_investment, funding_round| 
            investment = funding_round.startup.domain == domain ? funding_round.investment : 0
            total_investment + investment
        end
    end

    def self.tres_commas_club
        self.all.select { |venture_capitalist| venture_capitalist.total_worth > 1000000000}
    end

    def self.all
        @@all
    end
end
