class Startup
    attr_reader :name, :founder, :domain

    @@all = []
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(new_name, new_domain)
        @name = new_name
        @domain = new_domain
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        funding_rounds = FundingRound.all.map { |funding_round| funding_round.startup == self}
        funding_rounds.length
    end
    
    def funding_rounds
        FundingRound.all.select { |funding_round| funding_round.startup == self}
    end

    def total_funds
        total = 0
        funding_rounds.each { |funding_round| total += funding_round.investment  }
        total
    end

    def investors
        investors_arr = funding_rounds.map { |funding_round| funding_round.venture_capitalist}
        investors_arr.uniq
    end

    def big_investors
        big_arr = investors.select { |investor| investor.total_worth > 1000000000}
        big_arr.uniq
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_pass)
        @@all.find { |startup| startup.founder == founder_pass}
    end

    def self.domains
        @@all.map { |startup| startup.domain }
    end

end
