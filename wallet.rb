require_relative 'blackjack_rules.rb'


class Wallet
  attr_accessor 
  
  def initialize(player_amount, player_bet, player_won)
    @player_amount = 0
    @player_bet = 0
    @player_won = 0
  end

  def display_amount
    puts @player_amount
  end

  def wager
    # player_amount <= wager ? @player_bet += @player_amount : puts "Sorry you don't have enough"
    if player_amount <= wager
      @player_amount + player_bet = new_bet
    else
      puts "Sorry you don't have enough"
    end
  end
end