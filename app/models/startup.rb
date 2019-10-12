class Startup

    attr_accessor :name
    attr_reader :founder, :domain

    @@all =[]

    def initialize(name, founder, domain) 
        @name = name
        @founder = founder
        @domain = domain

        self.class.all << self

    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        all.select{|startup| startup.founder == founder}.first
    end

    def self.domains
        all.map{|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end

    def num_funding_rounds
        funding_rounds.count
    end

    def total_funds
        funding_rounds.map{|funding| funding.investment}.sum
    end

    def investors
        funding_rounds.map{|funding| funding.venture_capitalist}.uniq
    end

    def big_investors
        investors.select{|investor| VentureCapitalist.tres_commas_club.find{|inv| inv == investor}}
    end


    private

    def funding_rounds
        FundingRound.all.select{|funding| funding.startup == self}
    end

end
