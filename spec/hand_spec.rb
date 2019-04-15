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
  let(:hand_6) { [:Q,:Q,3,3,3] }

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
      game.current_hand = [3,3,3]
      expect(game.adjust_hand(hand_1)).to eq([:K,:K])
    end 
  end 

  describe '#high_card' do 
    it 'returns the high card in the hand' do 
      expect(game.high_card(hand_1)).to eq(:K)
    end 
  end 

  describe '#pair?' do 

    it 'returns boolean' do 
      expect(game.pair?(hand_2)).to eq(true)
    end 

    it 'populates variable current_hand with the pair/s' do
      game.pair?(hand_1)
      expect(game.current_hand).to eq([:K,:K,3,3])
      game.current_hand = []
      game.pair?(hand_2) 
      expect(game.current_hand).to eq([4,4,9,9])
      game.current_hand = []
      game.pair?(hand_5)
      expect(game.current_hand).to eq([:Q,:Q,:Q,:Q])
      game.current_hand = []
      game.pair?(hand_4)
      expect(game.current_hand).to eq([:A,:A])
    end 
  end

  describe '#two_pairs?' do 

    it 'returns boolean' do 
      expect(game.two_pairs?(hand_2)).to eq(true)
      expect(game.two_pairs?(hand_4)).to eq(false)
    end 
  end 

  describe '#three_of_a_kind?' do 
    
    it 'calls #pair? and #adjust_hand' do 
      expect(game).to receive(:pair?).with(hand_4).and_return(true)
      game.three_of_a_kind?(hand_4)    
    end

    it 'returns boolean' do 
      expect(game.three_of_a_kind?(hand_4)).to eq(true)
        game.current_hand = []
      expect(game.three_of_a_kind?(hand_2)).to eq(false)
    end 
  end 

  describe '#four_of_a_kind?' do 

    it 'calls #adjust_hand?' do 
      expect(game).to receive(:two_pairs?).with(hand_5).and_return(true)
      game.four_of_a_kind?(hand_5)
    end 

    it 'returns boolean' do 
      expect(game.four_of_a_kind?(hand_5)).to eq(true)
        game.current_hand = []
      expect(game.four_of_a_kind?(hand_2)).to eq(false)
    end 
  end 

  describe '#full_house?' do

    it 'calls #three_of_a_kind?, #adjust_hand, and #pair?' do 
      expect(game).to receive(:three_of_a_kind?).with(hand_6).and_return(true)
      expect(game).to receive(:adjust_hand).with(hand_6).and_return([:Q,:Q])
      expect(game).to receive(:pair?).with([:Q,:Q]).and_return(true)
      game.full_house?(hand_6)
    end 
  end 

  describe '#straight?' do 
    let(:straight_1) { [2,3,4,5,6] }
    let(:straight_2) { [9,10,:J,:Q,:K] }

    it 'returns boolean' do 
      expect(game.straight?(straight_1)).to eq(true)
      expect(game.straight?(straight_2)).to eq(true)
      expect(game.straight?([2,4,7,9,6])).to eq(false)
      expect(game.straight?(hand_1)).to eq(false)
    end 
  end 

  describe '#flush?' do 
    let(:flush) { [:H,:H,:H,:H,:H] }

    it 'returns boolean' do 
      expect(game.flush?(flush)).to eq(true)
      expect(game.flush?([:S,:S,:S,:S,:D])).to eq(false)
    end 
  end 

  describe '#straight_flush?' do 

    it 'calls #straight? and #flush?' do 
      expect(game).to receive(:straight?).and_return(true)
      allow(game).to receive(:flush?).and_return(false)
      game.straight_flush?([9,10,:J,:Q,:K])
    end 
  end 
end 

  

