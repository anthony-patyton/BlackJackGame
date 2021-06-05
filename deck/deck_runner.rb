require_relative 'deck'

SUITS = %w[Hearts Spades Clubs Diamonds]
RANKS = %w[Ace 2 3 4 5 6 7 8 9 10 Jack Queen King]
COLORS = %w[Red Black]
deck  = Deck.new(SUITS, RANKS, COLORS)
puts deck.deck

# puts "---------- Shuffled deck ---------"
# puts deck.shuffle
# puts "---------- delt card ---------"
# puts deck.deal_card 
# puts 
# new_deck = []
# new_deck.push(Card.new("Hearts", "8"))
# new_deck.push(Card.new("Hearts", "9"))
# new_deck.push(Card.new("Hearts", "10"))
# new_deck.push(Card.new("Hearts", "Ace"))
# puts new_deck
# puts "--------- Deck has been replaced ---"
# deck.replace_with(new_deck)
# puts deck.deck
# puts deck.shuffle
# puts deck.deal_card
# puts deck.class