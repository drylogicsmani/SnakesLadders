class SnakesLadders

  attr_accessor :board, :token1, :token2
 
  def initialize(token1, token2)
    @token1 = token1
    @token2 = token2
    @board = Array.new(10){Array.new(10).map{|arr| arr = []}}
    @current_token = nil
  end

    # dice = SingleDice.new.roll
  def move(position, dice, token)
    
    current_position = Position.new(position.x,position.y)  
    token_at(position).delete_if{|t| t == token}
    current = current_position +(dice)
    byebug
    
    # current_position << token  

  end

  def token_at(position)
    
    @board[position.x][position.y]
  end

end
# p SnakesLadders.new(:X, :Y).move(@board[position.x][position.y],:x)
# p @board