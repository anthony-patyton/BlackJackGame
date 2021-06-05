require 'pry'
class Card

  attr_accessor :suit, :rank, :show, :color
  SUITS = %w[Hearts Spades Clubs Diamonds]
  RANKS = %w[Ace 2 3 4 5 6 7 8 9 10 Jack Queen King]
  COLORS = %w[Red Black]

  # binding.pry
  def initialize suit, rank, color
    @show = true
    if SUITS.include?(suit) && RANKS.include?(rank)
      @suit = suit
      @rank = rank
      @color = color
    else
      @suit = "UNKOWN"
      @rank = "UNKOWN" 
      @color = "UNKOWN"
    end
  end
  
  def to_s
    if show
      "#{rank} of #{suit} #{color}"
    else
      ""
    end
  end

end