require_relative 'deck'

class Hand
  CARDS = [2,3,4,5,6,7,8,9,10,:J,:Q,:K,:A]

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
          # @current_hand.uniq! Add after instances created
          return true
        end 
      end
    end 
    false
  end 
  
  def two_pairs?(cards)
    if pair?(cards)
      adjusted_hand = adjust_hand(cards)
      return pair?(adjusted_hand)
    end
  end 

  def three_of_a_kind?(cards)
    if pair?(cards)
      adjusted_hand = adjust_hand(cards)
      adjusted_hand.each do |card|
        if current_hand.include?(card)
          current_hand << card
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
    false 
  end 
  
  def full_house?(cards)
    if pair?(cards)
    end 
  end 

# put hands in hash-whoever has the highest key, wins 

  # def hand(player)
  #   player.each do |card|
  #     has_a_pair?(player, card)
  #   end 
  # end 


end 