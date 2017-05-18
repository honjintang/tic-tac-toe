require 'grid'

describe Grid do

  Test = Struct.new(:value)
  test_config = [[Test.new('testing'),'',''], ['','',''], ['','','']]
  subject(:grid) { described_class.new({setup: test_config}) }

  context "#initialize" do

    it "grid has 3 rows by default" do
      expect(grid.setup.length).to eq(3)
    end

    it "each row contains 3 cells by default" do
      grid.setup.each do |row|
        expect(row.length).to eq(3)
      end
    end

  context "#get cell" do

    it "returns the cell at a given [x, y] coordinates" do
      expect(grid.get_cell(0, 0).value).to eq('testing')
    end
  end

  context "#set_cell_mark" do

    it "sets the value of a cell at given [x, y] coordinates" do
      grid.set_cell_mark(0, 0, :X)
      expect(grid.get_cell(0, 0).value).to eq(:X)
    end
  end

end
end
