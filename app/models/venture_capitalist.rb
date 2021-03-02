class VentureCapitalist
   attr_reader :name
   attr_accessor :total_worth

   @@all=[]

   def initialize(name, total_worth)
      @name = name
      @total_worth = total_worth
      self.class.all << self
   end

   def self.tres_commas_club
      self.all.select{|venture_capitalist| venture_capitalist.total_worth > 999999999}
   end

   def funding_rounds 
      FundingRound.all.select{|round| round.capitalist == self}
   end
    
   def portfolio
      funding_rounds.map{|round| round.capitalist == self ; round.startup}
   end
   
   def biggest_investment
      big_schmoney
      FundingRound.all.select{|round| total < round.investment && round.capitalist == self ; big_schmoney = round.investment}
   end

   def invested(domain) 
      total = 0 
      FundingRound.all.select{|startup| startup.domain == domain ; total += round.investment}.map{|rounds| rounds.capitalist}.uniq
      total
   end

   

   def big_investors
      investors.select{|capitalist|}
   end

 end
