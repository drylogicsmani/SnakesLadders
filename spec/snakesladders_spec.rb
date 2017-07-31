describe 'Snakes&Ladders' do 
    game = SnakesLadders.new(:X, :Y)
    dice = SingleDice.new
    let(:p0x1) {Position.new(0,1)}
    let(:p0x4) {Position.new(0,4)}
    let(:p0x2) {Position.new(0,2)}
    let(:p0x0) {Position.new(0,0)}
    let(:p3x1) {Position.new(3,1)}
    let(:p3x5) {Position.new(3,5)}
    let(:p4x0) {Position.new(4,0)}
    let(:p4x6) {Position.new(4,6)}
    let(:p3x3) {Position.new(3,3)}
    let(:p3x6) {Position.new(3,6)}





  it 'should assign tokens to players' do 
    expect(game.token1).to eq(:X)
    expect(game.token2).to eq(:Y)
  end 
  
  it 'should players enter to board when outcome of dice one'do
    dice = double()
    dice.stub(:roll) {1}
    game.token(p0x0, :Y)
    expect(game.token_at(p0x0)).to include(:Y)
  end
  
  it 'should token move according to outcome of event' do 
    [2..6].each do |not_one|
      dice = double()
      dice.stub(:roll) { not_one }
      game.move(p3x1, 4, :X)
      expect(game.token_at(p3x5)).to include(:X)
    end
  end
  
  it 'should place multiple token in same cell' do
    game.move(p0x2, 2, :X)
    game.move(p0x1, 3, :Y)
    expect(game.token_at(p0x4)).to include(:X, :Y)
  end
  
  it 'should current token move twice when outcome of dice 6' do 
    

    expect{game.move(p4x0, 6, :X)}.to raise_error("X takes another turn.")

  end
  it 'should token placed on head of snake it move to tail of snake'
  it 'should token placed on bottom of ladder it move to top of ladder'

  context 'Win' do

    it 'should current token placed in 100 cell'

  end
end