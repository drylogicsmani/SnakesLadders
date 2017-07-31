class SnakesLadders

  attr_accessor :board, :token1, :token2, :outcome, :origin
  
  def initialize(token1, token2)
    @token1 = token1
    @token2 = token2
    @board = Array.new(10){Array.new(10).map{|arr| arr = []}}
    @origin = Position.new(0,0)

    # dice = SingleDice.new
    # @outcome = dice.roll

    # @current_token = nil
  end 
  
  def move(position, outcome, token)
    if (outcome == 1) && (check_token(token))
      current = Position.new(0, 0)  
      @board[current.x][current.y] << token
    else
      current_position = Position.new(position.x, position.y)  
      token_at(position).delete_if{ |t| t == token}
      current = current_position +(outcome)
      @board[current.x][current.y] << token
    end
    raise "#{token} takes another turn." if(outcome == 6)
  end
  
  def check_token(token)
    @board.flatten.all? { |place| place != token }
  end

  def token_at(position)
    @board[position.x][position.y]
  end

  def token(position, token)
    @board[position.x][position.y] << token
  end

end
p @board
p SnakesLadders.new(:X,:Y).check_token(:X)