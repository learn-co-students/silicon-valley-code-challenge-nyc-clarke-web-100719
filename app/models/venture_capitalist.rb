class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select { |funding_round| funding_round.venture_capitalist == self }
    end

    def portfolio
        portfolio_arr = funding_rounds.map { |funding_round| funding_round.startup }
        portfolio_arr.uniq
    end

    def biggest_investment
        investment_arr = funding_rounds.map { |funding_round| funding_round.investment }
        investment_arr.sort!
        investment_arr[-1]
    end

    
    def invested(domain_string)
        total = 0
        FundingRound.all.each do |funding_round|
            if funding_round.startup.domain == domain_string
                total += funding_round.investment
            end
        end
        total
    end

    def self.all 
        @@all
    end

    def self.tres_commas_club
        @@all.select { |venturecapitalist| venturecapitalist.total_worth > 1000000000}
    end
end
