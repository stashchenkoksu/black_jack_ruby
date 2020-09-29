# Back Jack game

This project is to demonstrate knowledge of Object Oriented Programming Language in Ruby, building a Black Jack game on the command line where player can play with computer.

# Mechanics and game rules

There is a player (user) and a dealer (controlled by the program).

First, we ask the user for a name and then the game starts.

When the game starts, the user and the dealer have $ 100 in the pot

The user is given random 2 cards that he sees (cards are indicated by conventional notation, for example, "K +" - the king of crosses, "K <3" - the king of hearts, "K ^" - the king of spades, "K <>" - the king of diamonds etc. If you wish, you can use Unicode characters for the suits.)

Also, 2 random cards are given to the "dealer" against whom the user is playing. The user does not see the dealer's cards, asterisks are shown instead.

The user sees the sum of his points. The amount is calculated as follows: from 2 to 10 - at the face value of the card, all the "pictures" - 10 each, ace - 1 or 11, depending on which value is closer to 21 and what does not lead to a loss (the sum is more than 21).
After the deal, a $ 10 bet is automatically placed in the game pot from the player and the dealer. (The player and the dealer deduct 10 from the bank)

After that, the move goes to the user. The user has 3 options to choose from:
Skip. In this case, the turn goes to the dealer (see below)
Add a card. (only if the user has 2 cards in his hand). In this case, the player is added another random card, the sum of the points is recalculated, and the move goes to the dealer. Only one card can be added.
Open cards. The dealer's and the player's cards are revealed, the player sees the amount of the dealer's points, the game results are calculated (see below).

The dealer's move (controlled by the program, the goal is to win, that is, to collect the amount of points as close as possible to 21).

The dealer can:
Skip a turn (if the dealer has 17 or more points). The turn is transferred to the player.
Add a card (if the points are less than 17). The dealer has a new card (closed for the user). After that, the turn goes to the player. Only one card can be added.

Players reveal their cards either when they reach 3 cards (automatically), or when the user selects the "Open cards" option. After that, the user sees the dealer's cards and the amount of his points, as well as the result of the game (who won and who lost). Calculation of results:

The winner is the player whose score is closer to 21
If the player has more than 21 points, then he lost
If the sum of the points of the player and the dealer is the same, then a draw is declared and the money from the bank is returned to the players
The amount from the bank of the game goes to the winner
After the end of the game, we ask the user if he wants to play again. If yes, then the game starts over from the deal of cards, if not, then we quit.

*Stashchenko Kseniya**

- Github: [https://github.com/stashchenkoksu](https://github.com/stashchenkoksu)
- Telegram: [https://t.me/StashchenkoKseniya](https://t.me/StashchenkoKseniya)
- Linkedin: [https://www.linkedin.com/in/stashchenkokseniya/](https://www.linkedin.com/in/stashchenkokseniya/)

