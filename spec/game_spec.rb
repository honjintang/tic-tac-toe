require 'game'
require 'grid'

describe Game do

  let(:player1) { double :player, mark: :X }
  let(:player2) { double :player, mark: :O }
  let(:grid) { Grid.new }
  let(:input) { {player1: player1, player2: player2, grid: grid} }
  subject(:game) { described_class.new(input) }

  context "#initialize" do

    it "is initialized with player1 as current_player" do
      expect(game.current_player).to eq player1
    end

    it "is initialized with player2 as other_player" do
      expect(game.other_player).to eq player2
    end

    it "is initialized with a grid" do
      expect(game.grid).to eq grid
    end

  context "#claim" do

    it "tells the grid to set a cell with the current player's mark" do
      game.claim(0,0)
      expect(game.grid.get_cell(0,0).value).to eq(:X)
    end

    it ""
  end

  end
end
