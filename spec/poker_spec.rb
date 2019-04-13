require 'poker'
require 'hand'

describe Hand do 
  subject(:game) { Hand.new }
  # let(:cards) { [2,3,4,5,6,7,8,9,10,:J,:Q,:K,:A]}
  let(:players) { player_hash = {1=>[5,9,10,:K,:Q], 2=>[:J,3,5,:A,8]} }
  let(:hand_1)  { [:K,:K,3,3,3] }
  let(:hand_2) { [4,4,:A,9,9] }
  let(:hand_3) { [:A,:J,7,3,8] }
  let(:hand_4) { [:A,:A,:A,2,6] }
  let(:hand_5) { [:Q,:Q,:Q,:Q,5] }

  it 'initializes with variable current_hand set to an empty array' do 
    expect(game.current_hand).to eq([])
  end 

  describe '#discard' do 
    it 'discards a number of cards from the players hand' do 
      expect(game.discard(players[1], [1,3,4])).to match_array([5, 10])
    end 
  end 

  describe '#adjust_current_hand' do
    let(:hand_5) { [:A,9,9] }

    it 'removes discarded cards from the current hand' do 
      game.current_hand = [4,4]
      expect(game.adjust_current_hand(hand_5)).to eq([])
    end 
  end 

  describe '#adjust_hand' do 
    it 'removes cards to check whether hand can be formed with remaining cards' do
      game.current_hand = [4,4]
      expect(game.adjust_hand(hand_2)).to eq([:A,9,9])
    end 
  end 

  describe '#high_card' do 
    it 'returns the high card in the hand' do 
      expect(game.high_card(hand_1)).to eq(:K)
    end 
  end 

  describe '#pair?' do 
    it 'returns whether hand has a single pair' do 
      expect(game.pair?(hand_2)).to eq(true)
    end 
  end

  describe '#two_pairs?' do 

    context 'hand has two pairs' do 
      it 'returns true' do 
        expect(game.two_pairs?(hand_2)).to eq(true)
      end 
    end 

    context 'hand has three of a kind' do 
      it 'returns false' do
        expect(game.two_pairs?(hand_4)).to eq(false)
      end 
    end 
  end 

  describe '#three_of_a_kind?' do 

    it 'calls #adjust_hand' do 
      expect(game).to receive(:adjust_hand).with(hand_4).and_return([:A,2,6])
      game.three_of_a_kind?(hand_4)    
    end

    context 'hand has three of a kind' do 
      it 'returns true' do 
        expect(game.three_of_a_kind?(hand_4)).to eq(true)
      end 
    end

    context 'hand does not have three of a kind' do 
      it 'returns false' do 
        expect(game.three_of_a_kind?(hand_2)).to eq(false)
      end 
    end 

    describe '#four_of_a_kind?' do 
      
      it 'calls #adjust_hand?' do 
        expect(game).to receive(:two_pairs?).with(hand_5).and_return(true)
        game.four_of_a_kind?(hand_5)
      end 
    end 

    context 'hand has four of a kind' do 
      it 'returns true' do 
        expect(game.four_of_a_kind?(hand_5)).to eq(true)
      end 
    end 

    context 'hand does not have four of a kind' do 
      it 'returns false' do 
        expect(game.four_of_a_kind?(hand_2)).to eq(false)
      end 
    end 

    describe '#full_house?' do

       it 'calls #pair?' do 
        expect(game).to receive(:pair?).with(hand_1).and_return(true)
        game.full_house?(hand_1)
      end 
    end 

    # context 'hand has four of a kind' do 
    #   it 'returns true' do 
    #     expect(game.four_of_a_kind?(hand_5)).to eq(true)
    #   end 
    # end 

    # context 'hand does not have four of a kind' do 
    #   it 'returns false' do 
    #     expect(game.four_of_a_kind?(hand_2)).to eq(false)
    #   end 
    # end 

    
  end 

  # describe '#hand' do 
  #   it 'calculates what hand the player has' do 
  #     expect(game.hand(hand_1)).to eq("full house")
  #     expect(game.hand(hand_2)).to eq("two pairs")
  #     expect(game.hand(hand_3)).to eq("high card: A")
  #   end 
  # end 

  # describe '#winning_hand' do 
  #   it 'chooses the best hand' do 
  #   end 
  # end 

end 
  # Hand
      #call on deal to give new cards
    # The logic of calculating pair, three-of-a-kind, two-pair, etc. goes here.
    # Logic of which hand beats which would go here.

    #pair, two pairs, three of a kind, four of a kind, full house
    #straight, flush, straight flush 
    #then check high card of the hand to find the winner 

#   Player
      # Each player has a hand, plus a pot
      # Player has methods to ask the user:
        # Which cards they wish to discard
        # Whether they wish to fold, see, or raise.
  # Game
      # Holds the deck
      # Keeps track of whose turn it is
      # Keeps track of the amount in the pot.


