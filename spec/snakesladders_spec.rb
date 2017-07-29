describe 'Snakes&Ladders' do 
  game = SnakesLadders.new(:X, :Y)
   let(:p0x1) {Position.new(0,1)}
   let(:p0x4) {Position.new(0,4)}

  it 'should assign tokens to players' do 
    expect(game.token1).to eq(:X)
    expect(game.token2).to eq(:Y)
  end 
  it 'should players enter to board when outcome of dice one'
  it 'should token move according to outcome of dice'
  it 'should place multiple token in same cell' do
    game.move(p0x1,3,:X)
    game.move(p0x1,3,:Y)
    expect(game.token_at(p0x4)).to be([:X,:Y])
  end
  it 'should current token move twice when outcome of dice 6'
  it 'should token placed on head of snake it move to tail of snake'
  it 'should token placed on bottom of ladder it move to top of ladder'

  context 'Win' do

    it 'should current token placed in 100 cell'

  end
end