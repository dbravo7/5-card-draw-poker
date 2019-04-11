require 'card'
require 'deck'

describe Card do 
  subject(:game) {Card.new(5, "d", :symbol, :white)}

  it "initializes with card value and whether its revealed" do
    expect(game.revealed).to eq(false)
    expect(game.value).to eq(5)
    expect(game.suit).to eq("d")
    expect(game.color).to eq(:white)
    expect(game.symbol).to eq(:symbol)
  end 

  describe '#reveal' do 
    it 'changes revealed to true' do 
      expect(game.reveal).to eq(true)
    end 
  end 

  describe '#unreavealed' do 
    it 'calls the symbol for a face down card' do 
      expect(game.unrevealed).to eq("🂠")
    end 
  end 

end 

describe Deck do 
  subject(:game) { Deck.new }
  
  # it 'initializes as a shuffled deck' do 
  #   expect(game.deck).to eq(:cards)
  # end 

  describe '#form_deck' do 
    let(:deck) { game.deck }

    it 'creates a deck of 52 cards' do 
      expect(game.deck.count).to eq(52)
    end 

    it 'creates a deck of unique cards' do 
      expect(deck == deck.uniq).to eq(true)
    end 
  end 

  describe '#shuffle' do 
    let(:deck) { double("deck") }
    
    it "shuffles the deck" do 
      expect(deck).to receive(:shuffle)
      game.shuffle
    end 
  end 
end 