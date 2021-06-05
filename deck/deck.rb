require_relative '../card/card'

class Deck
  attr_reader :deck, :suits, :ranks, :colors
  SUITS = %w[Hearts Spades Clubs Diamonds]
  RANKS = %w[Ace 2 3 4 5 6 7 8 9 10 Jack Queen King]
  COLORS = %w[Red Black]

  def initialize suits, ranks, colors
    @deck = []
    @suits = suits
    @ranks = ranks
    @colors = colors
    create_deck
  end
  
  def shuffle
    @deck.shuffle!
  end
  
  def deal_card
    @deck.pop
  end

  def replace_with new_deck
    @suits = []
    @ranks = []
    @deck  = new_deck

    new_deck.each do |card|
      add_suits_and_ranks(card)
    end
    self
  end

  private

  def create_deck
    suits.each do |suit|
      ranks.each do |rank|
        color = (suit == 'Spades' || suit == 'Clubs') ? 'Black' : 'Red' 
          @deck.push(Card.new(suit, rank, color))
      end
    end
  end

  def add_suits_and_ranks card
    suit = card.suit
    rank = card.rank
    color = card.color

    @suits.push(suit) unless @suits.include? suit
    @ranks.push(suit) unless @ranks.include? rank
    @colors.push(suit) unless @colors.include? color

  end
end
