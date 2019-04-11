require_relative 'card'

class Deck
  attr_accessor :deck

  def initialize 
    @deck = []
    # form_deck
    # shuffle 
  end 

  def form_deck
    cards = [:A,2,3,4,5,6,7,8,9,10,:J,:Q,:K]
    # suits = [:D,:S,:C,:H]
    hearts = ['🂱', '🂲', '🂳', '🂴', '🂵', '🂶', '🂷', '🂸', '🂹', '🂺', '🂻', '🂼', '🂽', '🂾']
    spades = ['🂡', '🂢', '🂣', '🂤', '🂥', '🂦', '🂧', '🂨', '🂩', '🂪', '🂫', '🂬', '🂭', '🂮']
    diamonds = ['🃁', '🃂', '🃃', '🃄', '🃅', '🃆', '🃇', '🃈', '🃉', '🃊', '🃋', '🃌', '🃍', '🃎']
    clubs = ['🃑', '🃒', '🃓', '🃔', '🃕', '🃖', '🃗', '🃘', '🃙', '🃚', '🃛', '🃜', '🃝', '🃞']

    i = 0
    while i < cards.length 
      deck << Card.new(cards[i], :H, hearts[i], :red) 
      deck << Card.new(cards[i], :D, diamonds[i], :red) 
      deck << Card.new(cards[i], :S, spades[i], :black) 
      deck << Card.new(cards[i], :C, clubs[i], :black)
      
      i += 1
    end 
  end 

  def shuffle 
    @deck.shuffle
  end 
end 