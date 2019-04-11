require 'byebug'
require_relative 'card'

class Deck
  attr_accessor :deck

  def initialize 
    @deck = []
    form_deck
    shuffle 
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

  def shuffle(deck) 
    deck.shuffle
  end 

  def deal(player, num)
    num.times {player << deck.pop}
  end 

  def start_game_deal(players)
    deal = 1
    while deal <= 5
      (1..players.length).each {|i| players[i] << deck.pop}
      deal += 1
    end 
    players 
  end 
end 