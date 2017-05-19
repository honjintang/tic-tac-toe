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
    raise "The game is already over" if game_finished?
    mark = current_player.mark
    grid.set_cell_mark(x, y, mark)
    announce_winner_or_change_turn
  end

  private

  attr_writer :current_player

  def announce_winner_or_change_turn
    return "Player #{current_player.mark} wins!" if grid.winner?
    return "Draw!" if grid.draw?
    change_turns
  end

  def change_turns
    current_player == player1 ? self.current_player = player2 : self.current_player = player1
    return "Player #{current_player.mark}'s turn"
  end

  def game_finished?
    grid.winner? || grid.draw?
  end

end
