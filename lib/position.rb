class Position 
  attr_accessor :x, :y
  
  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(count)
    forward = @y + count
    @x = @x + forward / 10
    @y = forward % 10  
    self
  end

end
