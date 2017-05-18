require 'grid'

describe Grid do

  subject(:grid) { described_class.new(setup: :default_grid)}

  context "#initialize" do

    it "initializes the grid with a default grid" do
      expect(grid.setup).to eq :default_grid
    end
  end
end
