require 'grid'

describe Grid do

  subject(:grid) { described_class.new }

  context "#initialize" do

    it "initializes the grid with a default configuration" do
      expect{ Grid.new(setup: :any_config) }.to_not raise_error
    end

    it "grid has 3 rows by default" do
      expect(grid.setup.length).to eq(3)
    end

    it "each row contains 3 cells by default" do
      grid.setup.each do |row|
        expect(row.length).to eq(3)
      end
    end

  end
end
