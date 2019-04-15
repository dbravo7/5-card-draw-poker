require 'byebug'

class PokerGame
	attr_reader :players, :deck 

	def initialize(num)
		@players = players_hash(num)
		@deck = Deck.new
		# play
	end 

	def players_hash(num)
		hash = {}
		(1..num).each {|num| hash[num] = []}
		hash 
	end 


end 

if $PROGRAM_NAME == __FILE__
	PokerGame.new
	end 
