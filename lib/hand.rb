require_relative 'deck'

class Hand
  CARDS = [2,3,4,5,6,7,8,9,10,:J,:Q,:K,:A]
  SUITS = [:H,:D,:S,:C]

  attr_accessor :current_hand  

  def initialize
    @current_hand = []
  end 

  def discard(player, arr)
    arr.each do |idx|
      player.insert(idx, nil)
      player.delete_at(idx + 1)
    end 
    player.compact!
    adjust_hand(player)
    player
  end 

  def adjust_current_hand(player_hand)
    current_hand.each do |card|
      if !player_hand.include?(card)
        current_hand.delete(card)
      end 
    end 
    current_hand 
  end 

  def adjust_hand(cards)
    i = 1
    cards.each_with_index do |card, idx|
      if current_hand.include?(card) && current_hand.length >= i
        cards.insert(idx, nil)
        cards.delete_at(idx + 1)
        i += 1
      end 
    end 
    cards.compact!
  end 
  
  def high_card(hand)
    CARDS.reverse.each do |card|
      if hand.include?(card)
        return card
      end 
    end 
  end 

  def pair?(cards)
    cards.each_with_index do |card, idx|
      cards.each_with_index do |card2, idx2|
        if idx2 > idx && card == card2
          @current_hand << card #dup when instances are added
          @current_hand << card2 #same as above 
          cards.delete_at(idx)
          cards.delete_at(idx2 - 1)
          pair?(cards)
          # @current_hand.uniq! Add after instances created
        end 
      end
    end 
    !current_hand.compact.empty? 
  end 
  
  def two_pairs?(cards)
    pair?(cards) && current_hand.length == 4
  end 

  def three_of_a_kind?(cards)
    if pair?(cards)
      cards.each do |card|
        if current_hand.include?(card)
          current_hand << card #dup when instances added
          return true 
        end 
      end 
    end 
    false 
  end 

  def four_of_a_kind?(cards)
    if two_pairs?(cards)
      return current_hand.all? {|card| card == current_hand[0]}
    end 
    pair?(cards)
  end 
  
  def full_house?(cards)
    if three_of_a_kind?(cards) 
      adjusted_hand = adjust_hand(cards)
      return pair?(adjusted_hand)
    end 
    pair?(cards)
  end 

  def straight?(cards)
    indexes = []
      # idx min - idx max == 5
      # debugger 
      cards.each do |card|
        CARDS.each_with_index do |card2, idx|
          if card == card2 
            indexes << idx
            break
          end 
        end 
      end 
      indexes.sort!
      indexes.max - indexes.min == 4
  end 

  def flush?(cards)
    cards.all? {|card| card == cards[0]}
  end 

  def straight_flush?(cards)
    straight?(cards) && flush?(cards)
  end 


end 