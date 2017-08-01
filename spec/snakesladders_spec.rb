describe 'Snakes&Ladders' do 
  game = SnakesLadders.new(:X, :Y)
  dice = SingleDice.new
  
  let(:p0x1) {Position.new(0,1)}
  let(:p0x4) {Position.new(0,4)}
  let(:p0x6) {Position.new(0,6)}
  let(:p1x2) {Position.new(1,2)}
  let(:p0x2) {Position.new(0,2)}
  let(:p0x0) {Position.new(0,0)}
  let(:p0x3) {Position.new(0,3)}
  let(:p3x1) {Position.new(3,1)}
  let(:p3x5) {Position.new(3,5)}
  let(:p4x0) {Position.new(4,0)}
  let(:p4x6) {Position.new(4,6)}
  let(:p3x3) {Position.new(3,3)}
  let(:p3x6) {Position.new(3,6)}
  let(:p5x0) {Position.new(5,0)}
  let(:p1x8) {Position.new(1,8)}
  let(:p1x1) {Position.new(1,1)}
  let(:p4x4) {Position.new(4,4)}
  let(:p9x5) {Position.new(9,5)}

  it 'should assign tokens to players' do 
    expect(game.token1).to eq(:X)
    expect(game.token2).to eq(:Y)
  end 
  
  it 'should players enter to board when outcome of dice one'do
    dice = double()
    dice.stub(:roll) {1}
    count = dice.roll
    game.move(p0x0, count, :Y)
    expect(game.token_at(p0x0)).to include(:Y)
  end

  it 'should players not enter to board when outcome of dice is not one' do
    dice = double()
    dice.stub(:roll) {3}
    count = dice.roll 
    expect{game.move(p0x0, count, :X)}.to raise_error ("X can't enter into game")
  end
  
  it 'should token move according to outcome of event' do  
    game.move(p0x0, 1, :X)
    game.move(p0x0, 3, :X)
    expect(game.token_at(p0x3)).to include(:X)
  end
  
  it 'should place multiple token in same cell' do
    game.move(p0x3, 3, :X)
    game.move(p0x1, 5, :Y)
    expect(game.token_at(p0x6)).to include(:X, :Y)
  end
  
  it 'should current token move twice when outcome of dice 6' do 
    game.move(p0x0, 1, :X)
    dice = double()
    dice.stub(:roll) {4}
    count = dice.roll
    expect{game.check_six(p4x0, 6, :X, count)}.to raise_error("X takes another turn.")
    expect(game.token_at(p5x0)).to include(:X)
  end
  
  it 'should token placed on head of snake it move to tail of snake' do 
    game.move(p5x0, 2, :Y)
    expect(game.token_at(p1x8)).to include(:Y)
  end
  
  it 'should token placed on bottom of ladder it move to top of ladder' do 
    game.move(p1x1, 1, :Y)
    expect(game.token_at(p4x4)).to include(:Y)
  end

  context 'Win' do

    it 'should current token placed in 100 cell' do 
      game.listener {|event|
      expect(event).to be_a(WinEvent)
      expect(event.winner).to be(:X)
      }
      game.move(p9x5, 4, :X)
    end
  end
end