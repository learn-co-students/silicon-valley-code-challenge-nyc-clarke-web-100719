class Startup
    attr_accessor :name
    attr_reader :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        self.class.all << self
    end

    def pivot(domain, name)
        @domain = domain
        self.name = name
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def funding_rounds
        FundingRound.all.select { |funding_round| funding_round.startup == self }
    end

    def investors
        funding_rounds.map { |funding_round| funding_round.venture_capitalist }.uniq
    end

    def big_investors
        investors.select { |investor| VentureCapitalist.tres_commas_club.include?(investor) }
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.reduce(0) { |total_funds, funding_round| total_funds + funding_round.investment }
    end

    def self.find_by_founder(name)
        self.all.find { |startup| startup.founder == name}
    end

    def self.domains
        self.all.map { |startup| startup.domain }.uniq
    end

    def self.all
        @@all
    end
end
