class FundingRound
  attr_reader :startup, capitalist, type, investment   
    
  @@all=[]

  def initialize(startup, capitalist, type, investment)
    @name = name
    @capitalist = capitalist
    @type = type
    @investment = investment
    self.class.all << self 
  end

  def self.all
    @@all
  end
   
end
