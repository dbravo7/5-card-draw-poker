require 'colorize'
class Card
  attr_reader :value, :suit, :symbol, :revealed, :color

  def initialize(value, suit, symbol, color)
    @value = value
    @suit = suit
    @symbol = symbol
    @color = color
    @revealed = false 
  end 

  def reveal
    @revealed = true
  end 

  def unrevealed
    "🂠"
  end 

  def to_s
    @revealed ? "#{symbol}".colorize(color) : unrevealed
  end 
end 