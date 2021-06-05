require_relative 'blackjack'

RSpec.describe Blackjack do
  describe "instance methods" do

    SUITS = %w[Hearts Spades Clubs Diamonds]
    RANKS = %w[Ace 2 3 4 5 6 7 8 9 10 Jack Queen King]
    COLORS = %w[RED BLACK]

    before do 
      @blackjack = Blackjack.new SUITS, RANKS
    end

    it 'should respond to player_hand' do
      expect(@blackjack).to respond_to(:player_hand)
    end 

    it 'should respond to dealer_hand' do
      expect(@blackjack).to respond_to(:dealer_hand)
    end 
    
    it 'should respond to playing' do
      expect(@blackjack).to respond_to(:playing)
    end 

    it 'should respond to current_gamer' do
      expect(@blackjack).to respond_to(:current_gamer)
    end
    
    it 'should respond to deal' do
      expect(@blackjack).to respond_to(:deal)
    end 

    it 'should respond to hit' do
      expect(@blackjack).to respond_to(:hit)
    end 

    it 'should respond to stand' do
      expect(@blackjack).to respond_to(:stand)
    end 

    it 'should respond to show hands' do
      expect(@blackjack).to respond_to(:show_hands)
    end 

    it 'should respond to set result' do
      expect(@blackjack).to respond_to(:set_result)
    end 
  end


  describe 'Dealing cards' do

    before do
      @blackjack = Blackjack.new SUITS, RANKS
      @blackjack.deal
      @player_cards = @blackjack.player_hand.dealt_cards
      @dealer_cards = @blackjack.dealer_hand.dealt_cards
    end
    
    it 'should return 2 cards for the dealer and player' do
      expect(@player_cards.count).to eq(2)
      expect(@dealer_cards.count).to eq(2)
    end
    
    it 'Should not display the dealers first card' do
      expect(@dealer_cards.first.show).to eq(false)
    end

    it 'Should end the the players turn if a blackjack is delt' do
       card1 = Card.new("Hearts", "3")
       card2 = Card.new("Hearts", "Ace")
       card3 = Card.new("Hearts", "4")
       card4 = Card.new("Hearts", "Jack")

       @blackjack = Blackjack.new SUITS, RANKS
       new_deck = [card2, card1, card4, card3]
       @blackjack.deck.replace_with(new_deck)
       @blackjack.deal
       expect(@blackjack.current_gamer).to eq('Dealer')
    end
  end

  describe 'Hitting a hand' do
    
    before do
      @blackjack = Blackjack.new SUITS, RANKS
      @blackjack.deal
      @player_cards = @blackjack.player_hand.dealt_cards
      @dealer_cards = @blackjack.dealer_hand.dealt_cards
    end

    it 'should only hit if playing is true' do
      expect(@blackjack.playing).to eq(true)
    end

    it 'should return 3 cards for the player and 2 for the dealer' do
      @blackjack.hit
      expect(@player_cards.count).to eq 3
      expect(@dealer_cards.count).to eq 2
    end

    it 'should return if the player has busted' do
      card1 = Card.new("Hearts", "3")
      card2 = Card.new("Hearts", "King")
      card3 = Card.new("Hearts", "10")
      card4 = Card.new("Hearts", "Jack")
      card5 = Card.new("Hearts", "Jack")
      card6 = Card.new("Hearts", "Jack")

      @blackjack = Blackjack.new SUITS, RANKS
      new_deck = [card1, card2, card3, card4, card5, card6]
      @blackjack.deck.replace_with(new_deck)
      @blackjack.deal
      @blackjack.hit
      expect(@blackjack.result).to eq('Player busted!')
    end

    it 'should return if the dealer has busted' do
      card1 = Card.new("Hearts", "3")
      card2 = Card.new("Hearts", "King")
      card3 = Card.new("Hearts", "Ace")
      card4 = Card.new("Hearts", "Jack")
      card5 = Card.new("Hearts", "Jack")
      card6 = Card.new("Hearts", "Jack")

      @blackjack = Blackjack.new SUITS, RANKS
      new_deck = [card1, card2, card3, card4, card5, card6]
      @blackjack.deck.replace_with(new_deck)
      @blackjack.deal
      @blackjack.current_gamer = 'Dealer'
      @blackjack.hit
      expect(@blackjack.result).to eq('Dealer busted!')
    end
  end

  describe 'Standing' do

    before do
      @blackjack = Blackjack.new SUITS, RANKS
    end
    
    it 'should switch current gamer from player to dealer' do
      card1 = Card.new("Hearts", "3")
      card2 = Card.new("Hearts", "King")
      card3 = Card.new("Hearts", "5")
      card4 = Card.new("Hearts", "Jack")
      card5 = Card.new("Hearts", "5")
      card6 = Card.new("Hearts", "Jack")
      new_deck = [card1, card2, card3, card4, card5, card6]
      @blackjack.deck.replace_with(new_deck)
      @blackjack.deal
      @blackjack.stand
      expect(@blackjack.current_gamer).to eq('Dealer')
    end
    
    it 'Dealer shouild hit when total value of cards is less than 17' do
      card1 = Card.new("Hearts", "3")
      card2 = Card.new("Hearts", "King")
      card3 = Card.new("Hearts", "5")
      card4 = Card.new("Hearts", "10")
      card5 = Card.new("Hearts", "5")
      card6 = Card.new("Hearts", "6")
      new_deck = [card1, card2, card3, card4, card5, card6]
      @blackjack.deck.replace_with(new_deck)
      @blackjack.deal
      expect(@blackjack.dealer_hand.get_value).to eq 16
      @blackjack.stand
      expect(@blackjack.dealer_hand.get_value).to eq 26
      expect(@blackjack.dealer_hand.dealt_cards.first.show).to eq true
    end
  end

  describe 'Show hands' do

    before do
      @blackjack = Blackjack.new SUITS, RANKS
      @blackjack.deal
    end
    
    it 'Should return the gamers hands' do
      expect(@blackjack.show_hands).to match(/Player's hand:/)
      expect(@blackjack.show_hands).to match(/Dealer's hand:/)
    end
  end

  describe 'Setting results' do

    before do
      @blackjack = Blackjack.new SUITS, RANKS
    end
    
    it 'returns if player busts' do
      card1 = Card.new("Hearts", "3")
      card2 = Card.new("Hearts", "Queen")
      card3 = Card.new("Hearts", "King")
      card4 = Card.new("Hearts", "10")
      card5 = Card.new("Hearts", "10")
      card6 = Card.new("Hearts", "8")
      new_deck = [card1, card2, card3, card4, card5, card6]
      @blackjack.deck.replace_with(new_deck)
      @blackjack.deal
      @blackjack.hit # player hits and busts
      expect(@blackjack.set_result).to eq('Player busts!')
    end

    it 'returns if dealer busts' do
      card1 = Card.new("Hearts", "3")
      card2 = Card.new("Hearts", "Queen")
      card3 = Card.new("Hearts", "King")
      card4 = Card.new("Hearts", "10")
      card5 = Card.new("Clubs", "10")
      card6 = Card.new("Hearts", "Jack")
      new_deck = [card1, card2, card3, card4, card5, card6]
      @blackjack.deck.replace_with(new_deck)
      @blackjack.deal
      @blackjack.stand # player stands with 20
      @blackjack.hit # Dealer hits and bust
      expect(@blackjack.set_result).to eq('Dealer busts!')
    end

    it 'returns if there is a tie' do
      card1 = Card.new("Hearts", "Ace")
      card2 = Card.new("Hearts", "Ace")
      card3 = Card.new("Hearts", "King")
      card4 = Card.new("Hearts", "10")
      card5 = Card.new("Hearts", "10")
      card6 = Card.new("Hearts", "Jack")
      new_deck = [card1, card2, card3, card4, card5, card6]
      @blackjack.deck.replace_with(new_deck)
      @blackjack.deal
      @blackjack.hit # player
      @blackjack.stand #player stands with 21
      @blackjack.hit # Dealer hits and gets 21
      expect(@blackjack.set_result).to eq('It is a tie!')
    end

    it 'returns if player wins' do
      card1 = Card.new("Hearts", "Ace")
      card2 = Card.new("Hearts", "Ace")
      card3 = Card.new("Hearts", "King")
      card4 = Card.new("Hearts", "10")
      card5 = Card.new("Hearts", "10")
      card6 = Card.new("Hearts", "9")
      new_deck = [card1, card2, card3, card4, card5, card6]
      @blackjack.deck.replace_with(new_deck)
      @blackjack.deal
      @blackjack.stand
      expect(@blackjack.set_result).to eq('Player wins!')
    end

    it 'returns if dealer wins' do
      card1 = Card.new("Hearts", "Ace")
      card2 = Card.new("Hearts", "Ace")
      card3 = Card.new("Hearts", "King")
      card4 = Card.new("Hearts", "10")
      card5 = Card.new("Hearts", "9")
      card6 = Card.new("Hearts", "Queen")
      new_deck = [card1, card2, card3, card4, card5, card6]
      @blackjack.deck.replace_with(new_deck)
      @blackjack.deal
      @blackjack.stand
      expect(@blackjack.set_result).to eq('Dealer wins!')
    end
    
  end
end