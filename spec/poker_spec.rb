require 'poker'
require 'player'

describe PokerGame do 
  subject(:game) { PokerGame.new(3) } 

  it 'initializes with players, calls player_hash, deck with players, and play' do 
    expect(game.players).to be_an(Hash)
    expect(game.deck).to be_an(Deck)
  end 

  describe '#players_hash' do 

    it 'populates hash with players that have an empty array as a value' do
      expect(game.players_hash(3)).to eq({1=>[],2=>[],3=>[]})
    end 
  end 

end 
  
  
  
  #Game class
    #  Holds the deck
# Keeps track of whose turn it is
# Keeps track of the amount in the pot.