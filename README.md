# Tic-Tac-Toe Tech Test

Business logic for a game of tic tac toe

### Brief

* There are two players in the game (X and O)
* Players take turns until the game is over
* A player can claim a field if it is not already taken
* A turn ends when a player claims a field
* A player wins if they claim all the fields in a row, column or diagonal
* A game is over if a player wins
* A game is over when all fields are taken

### How to play

Clone this repo and open in pry or irb:
```
git clone git@github.com:honjintang/tic-tac-toe.git
cd tic-tac-toe
pry
```
Start a new game:
```
require './lib/player'
require './lib/grid'
require './lib/game'

player1 = Player.new( {mark: :X} )
player2 = Player.new( {mark: :O} )
grid = Grid.new
game = Game.new( {player1: player1, player2: player2, grid: grid} )
```
Player X begins. Claim cells in the 3x3 grid by specifying x,y coordinates (top left is (0,0), middle is (1,1) etc.)
```
game.claim(0,0)
=> "Player O's turn"
game.claim(1,1)
=> "Player X's turn"
.
.
.
game.claim(2,0)
=> "Player X wins!"
```
