require 'grid'

describe Grid do

    subject(:grid) { described_class.new }
    Test_cell = Struct.new(:value)

    context "#initialize" do

      it "grid has 3 rows by default" do
        expect(grid.setup.length).to eq(3)
      end

      it "each row contains 3 cells by default" do
        grid.setup.each do |row|
          expect(row.length).to eq(3)
        end
      end

    context "#get_cell" do

      it "returns the cell at a given [x, y] coordinates" do
        test_config = [[Test_cell.new(:X),nil,nil], [nil,nil,nil], [nil,nil,nil]]
        grid = Grid.new({setup: test_config})
        expect(grid.get_cell(0, 0).value).to eq(:X)
      end
    end

    context "#set_cell_mark" do

      it "sets the value of a cell at given [x, y] coordinates" do
        grid.set_cell_mark(0, 0, :X)
        expect(grid.get_cell(0, 0).value).to eq(:X)
      end
    end

    context "#game_over" do

      let(:x_cell) { Test_cell.new(:X) }
      let(:o_cell) { Test_cell.new(:O) }
      let(:empty_cell) { Test_cell.new }

      it "returns :winner if winner? is true" do
        allow(grid).to receive(:winner?) {true}
        expect(grid.game_over).to eq(:winner)
      end

      it "returns :draw if draw? is true" do
        allow(grid).to receive(:draw?) {true}
        expect(grid.game_over).to eq(:draw)
      end

      it "returns :winner when row is complete with same marks" do
        test_config = [[x_cell,x_cell, x_cell],
                       [empty_cell, o_cell, o_cell],
                       [o_cell, o_cell, x_cell]]
        grid = Grid.new(setup: test_config)
        expect(grid.game_over).to eq(:winner)
      end

      it "returns :winner when column is complete with same marks" do
        test_config = [[x_cell,empty_cell, o_cell],
                       [x_cell, o_cell, o_cell],
                       [x_cell, o_cell, x_cell]]
        grid = Grid.new(setup: test_config)
        expect(grid.game_over).to eq(:winner)
      end

      it "returns :winner when left diaganol is complete with same marks" do
        test_config = [[x_cell,empty_cell, o_cell],
                       [o_cell, o_cell, x_cell],
                       [o_cell, x_cell, x_cell]]
        grid = Grid.new(setup: test_config)
        expect(grid.game_over).to eq(:winner)
      end

      it "returns :winner when left diaganol is complete with same marks" do
        test_config = [[x_cell,empty_cell, o_cell],
                       [o_cell, x_cell, x_cell],
                       [x_cell, o_cell, x_cell]]
        grid = Grid.new(setup: test_config)
        expect(grid.game_over).to eq(:winner)
      end

      it "returns :draw when grid is full but no winner" do
        test_config = [[x_cell,x_cell, o_cell],
                       [o_cell, o_cell, x_cell],
                       [x_cell, o_cell, x_cell]]
        grid = Grid.new(setup: test_config)
        expect(grid.game_over).to eq(:draw)
      end
    end
  end
end
