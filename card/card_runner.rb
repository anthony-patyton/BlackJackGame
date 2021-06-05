require_relative 'card'

suit = 'Hearts'
rank = '8'
color = 'RED'


card = Card.new suit, rank, color

puts card
card.show = false
puts card