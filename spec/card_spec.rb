require 'card'

describe Card do 
  subject(:card) {Card.new(5, "d", :symbol)}

  it "initializes with card value and whether its revealed" do
    expect(card.revealed).to eq(false)
    expect(card.value).to eq(5)
    expect(card.suit).to eq("d")
    expect(card.symbol).to eq(:symbol)
  end 
end 