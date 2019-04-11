
class Card
  attr_reader :value, :suit, :symbol, :revealed

  def initialize(value, suit, symbol)
    @value = value
    @suit = suit
    @symbol = symbol
    @revealed = false 
  end 

end 