class SingleDice 
  
  attr_accessor :dice
  
  def initialize
    @dice = (1..6)
  end
  
  def roll
    outcome = rand(@dice)
  end

end
