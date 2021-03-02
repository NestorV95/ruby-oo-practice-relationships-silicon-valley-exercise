class Startup
    attr_accessor :domain
    attr_reader :name, :founder

    @@all=[]

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain 
        self.class.all << self
    end

    def pivot(name, domain)
        @name = name
        @domain = domain
        self
    end

    def self.all
        @@all
    end

    def self.domains
        self.all.map{|startup| startup.domain}
    end

    def self.find_by_founder(name)
       self.all.collect{|startup| startup.founder == name}
    end

    def sign_contract(capitalist, type, investment)
        FundingRound.new(capitalist, type, investment)
    end

    def num_funding_rounds 
        FundingRound.all.count{|round| round.startup == self}
    end

    def total_funds
        funds = 0
        FundingRound.all.select{|round| round.startup == self; funds += rounds.investment}
        funds
    end

    def investors
        FundingRound.all.select{|round| round.startup == self; round.capitalist}
    end

    def big_investors
        investors.select{|capitalist| VentureCapitalist.tres_commas_club.any?(capitalist)}
    end
  
end