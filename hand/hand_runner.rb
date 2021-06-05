require_relative '../card/card'
require_relative 'hand'
hand = Hand.new
puts "Players hand"
hand.add_card(Card.new('Hearts', '8'))
hand.add_card(Card.new('Hearts', '9'))
puts hand
puts "Dealers hand"
hand2 = Hand.new
hand2.add_card(Card.new('Hearts', '7'))
hand2.add_card(Card.new('Hearts', 'Ace'))
puts hand2