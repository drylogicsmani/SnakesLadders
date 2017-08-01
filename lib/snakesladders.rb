class SnakesLadders

  attr_accessor :board, :token1, :token2, :outcome
  
  def initialize(token1, token2)
    @token1 = token1
    @token2 = token2
    @board = Array.new(10){Array.new(10).map{|arr| arr = []}}
    @snakesladders = {
      Position.new(5,2) => Position.new(1,8), Position.new(6,8) => Position.new(3,2), Position.new(9,7) => Position.new(0,4), 
      Position.new(4,9) => Position.new(1,1), Position.new(7,5) => Position.new(2,3), Position.new(8,8) => Position.new(6,2),
      Position.new(0,7) => Position.new(5,6), Position.new(2,8) => Position.new(3,4), Position.new(4,2) => Position.new(7,6),
      Position.new(1,2) => Position.new(4,4), Position.new(5,1) => Position.new(9,3), Position.new(6,5) => Position.new(8,5) }
  end 

  def listener (&observer)
    @observer = observer
  end
  
  def move(position, outcome, token)
    up_cell = @snakesladders.keys
    down_cell = @snakesladders.values
    if (outcome == 1) && (check_token(token))
      current = Position.new(0, 0)  
      @board[current.x][current.y] << token
    elsif (outcome != 1) && (check_token(token))
      raise "#{token} can't enter into game"
    else
      current_position = Position.new(position.x, position.y)  
      token_at(position).delete_if{ |t| t == token}
      current = current_position +(outcome)
      if (up_cell.any?{ |pos| [pos.x, pos.y] == [current.x,current.y]})
        current = @snakesladders.select { |key,value| [key.x, key.y] == [current.x, current.y]}.values[0]
      end
      @board[current.x][current.y] << token
      @observer.call(WinEvent.new(token)) if (@board[9][9].include?(token))
    end
  end

  def check_six(position, outcome, token, dice)
    move(position,outcome,token)
    if (outcome == 6)
      current = position + outcome
      move(current, dice, token) 
      raise "#{token} takes another turn."
    end
  end
  def check_token(token)
    @board.flatten.all? { |place| place != token }
  end

  def token_at(position)
    @board[position.x][position.y]
  end

end

class WinEvent
  def initialize(winner)
    @winner = winner
  end
  attr_reader :winner
end