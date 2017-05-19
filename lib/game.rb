require_relative 'grid'
require_relative 'player'

class Game

  attr_reader :current_player, :player1, :player2, :grid


  def initialize(input)
    @player1 = input.fetch(:player1)
    @player2 = input.fetch(:player2)
    @current_player = player1
    @grid = input.fetch(:grid)
  end

  def claim(x,y)
    raise "This cell has already been taken" if grid.get_cell(x,y).value != nil
    raise "The game is already over" if game_over?
    mark = current_player.mark
    grid.set_cell_mark(x, y, mark)
    return "Player #{current_player.mark} wins!" if grid.winner?
    return "Draw!" if grid.draw?
    change_turns
  end

  private

  attr_writer :current_player

def change_turns
  if current_player == player1
    self.current_player = player2
  else
    self.current_player = player1
  end
  return "Player #{current_player.mark}'s turn"
end


  def game_over?
    grid.winner? || grid.draw?
  end
end
