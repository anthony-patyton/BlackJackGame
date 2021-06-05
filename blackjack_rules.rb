
# Black Jack Game
# How to play Black Jack 
# 1. Dealer shuffles the cards
  # Use the method to def shuffle cards
# 2. The dealer gives every player 1 card and gives himself a card facing up
  # The player gets a random card and the dealer gets a random card
  # Each card can be displayed a puts class(make the code more dry)
# 3. Player puts in his bet
  # display their wallet
  # subtract from wallet user_amount_bettings
# 4. The dealer then repeats step 3 for the 2nd card
# Each random card can be displayed
  # The player and dealer each get a random card
# 5. The player see's his total count
  # Gives user his total count(adding value of each card) !IMPORTANT if user_card = ace they can have the option to change to 11 or 1.
  # Displays dealer_count
# 6. The player gets the option to hit or stay
  # display's player's option with strings
  # grabs user_input and tests his statement with a class
# 7. If the player hit's and is below 21 they can hit again or stay
    # use class for repeating that
  # if player has 2 same cards or 2 cards that add to 10 they can double down
    # test if both of his cards == 10 run double_down class if true
    # test players cards == players cards if equal run this double_down
    # double_down class
    # display's user's wallet
    # dipsplay's option for user to double his bet
      # if so grab from wallet and subtract amount of how much he first put down(step 3.)
    # They can double their bet or not.
  # If player stay's the dealer counts his cards
    #  create a class if dealer_count = x(example) 17 > x dealer hits if x >= 17 dealer stays
    #  display's dealer's count
# If dealer has 17 > total_count he hits. If he has 17 <= his total count he can stay. 

# TEST THIS EVERY STEP PLAYER HIT'S and Dealer hit's too
# 8. If player hit's and passes 21 "bust" player losesj
# puts "bust"
# 9. If dealer hit's and passes 21 they lose player wins
# puts "You win user_amount_bet"
# 10. If player and dealer both hit 21 they break
# if player_count == dealer_count
  # puts "Break"
  # adds user_bet to user's wallet
  # return again to play again.
# Match their count's to see who has the highest but below 21. 
# 11. if player: 21 > total_count > dealer_count player wins.
# 12. if player: 21 > total_count < dealer_count player loses.
# 13. if player total_count = dealer the break.

