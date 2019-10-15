class Startup

   attr_accessor :name, :domain
   attr_reader :founder
@@all = []
    def initialize(name,founder,domain)
        @name = name
        @founder = founder
        @domain = domain
        self.class.all << self
    end

    def self.all
        @@all
    end

    def pivot(new_name,new_domain)
        answer = self.class.all.each do |startup|
            startup.name = new_name
            startup.domain = new_domain
    end
    answer
    end

    def self.find_by_founder(name_looking_for)
        self.all.find {|startup| startup.founder == name_looking_for}
    end

    def domains
        self.class.all.map {|startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end


    def num_funding_rounds
            funding_rounds.count
    end

    def funding_rounds
        FundingRound.all.select { |funding_round| funding_round.startup == self }
    end

    def total_funds
        funding_rounds.reduce(0) { |total_funds, funding_round| total_funds + funding_round.investment }
    end

    def investors
        funding_rounds.map { |funding_round| funding_round.venture_capitalist }.uniq
    end

    def big_investors
        investors.select { |investor| VentureCapitalist.tres_commas_club.include?(investor) }
    end
    
end
