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

      it "is initialized with a grid" do
        expect(game.grid).to eq grid
      end

    context "#claim" do

      Test_cell = Struct.new(:value)
      let(:x_cell) { Test_cell.new(:X) }
      let(:o_cell) { Test_cell.new(:O) }
      let(:empty_cell) { Test_cell.new(nil) }

      before do
        test_config = [[empty_cell,x_cell, o_cell],
                        [o_cell, o_cell, x_cell],
                        [x_cell, o_cell, x_cell]]
        grid = Grid.new(setup: test_config)
        game = Game.new( {player1: player1, player2: player2, grid: grid} )
      end

      it "tells the grid to set a cell with the current player's mark" do
        game.claim(0,0)
        expect(game.grid.get_cell(0,0).value).to eq(:X)
      end

      it "changes player's turn after a go" do
        game.claim(0,0)
        expect(game.current_player).to eq player2
      end

      it "confirms the next player's turn" do
        expect(game.claim(0,0)).to eq("Player O's turn")
      end

      it "raises an error if player tries to claim a cell that is already taken" do
        game.claim(0,0)
        expect{ game.claim(0,0) }.to raise_error("This cell has already been taken")
      end

      it "raises error if game is already over" do
        test_config = [[empty_cell,x_cell, o_cell],
                        [o_cell, o_cell, x_cell],
                        [x_cell, x_cell, x_cell]]
        grid = Grid.new(setup: test_config)
        game = Game.new( {player1: player1, player2: player2, grid: grid} )
        expect{ game.claim(0,0) }.to raise_error("The game is already over")
      end

       it "announces winner" do
         test_config = [[empty_cell,x_cell, x_cell],
                         [empty_cell, empty_cell, empty_cell],
                         [o_cell, x_cell, o_cell]]
         grid = Grid.new(setup: test_config)
         game = Game.new( {player1: player1, player2: player2, grid: grid} )
         expect(game.claim(0,0)).to eq("Player X wins!")
       end

       it "announces draw" do
         test_config = [[empty_cell,o_cell, x_cell],
                         [o_cell, o_cell, x_cell],
                         [x_cell, x_cell, o_cell]]
         grid = Grid.new(setup: test_config)
         game = Game.new( {player1: player1, player2: player2, grid: grid} )
         expect(game.claim(0,0)).to eq("Draw!")
       end
     end
  end
end
