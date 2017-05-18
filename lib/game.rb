require_relative 'grid'
require_relative 'player'

class Game

  attr_reader :current_player, :other_player, :grid

  def initialize(input)
    @current_player = input.fetch(:player1)
    @other_player = input.fetch(:player2)
    @grid = input.fetch(:grid)
  end

  def claim(x,y)
    fail "The game is already over" if game_over?
    mark = current_player.mark
    grid.set_cell_mark(x, y, mark)
    return "Player #{current_player.mark} wins" if grid.winner?
    return "Draw!" if grid.draw?
    change_turns
  end


private

  def game_over?
    grid.winner? || grid.draw?
  end
end
