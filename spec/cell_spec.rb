require 'cell'

describe Cell do

  subject(:cell) { described_class.new }

  context "#initialize" do
    it "is initialized with a default value of nil" do
      expect(cell.value).to eq nil
    end

    it 'it can be initialized with a value of X' do
      cell = Cell.new('X')
      expect(cell.value).to eq 'X'
    end
  end
end
