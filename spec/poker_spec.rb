require 'poker'

# Classes you will want
  # Card : value, revealed=false, to_s
      #symbol 
  # Deck : shuffle, deal 
  # Hand
    # The logic of calculating pair, three-of-a-kind, two-pair, etc. goes here.
    # Logic of which hand beats which would go here.

#   Player
      # Each player has a hand, plus a pot
      # Player has methods to ask the user:
        # Which cards they wish to discard
        # Whether they wish to fold, see, or raise.
  # Game
      # Holds the deck
      # Keeps track of whose turn it is
      # Keeps track of the amount in the pot.



# Deck
  # create the deck
  # for each card initialize card
  # get the value and symbol from deck