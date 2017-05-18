require 'player'

describe Player do

  let (:input) { {mark: :X}}
  subject(:player) { described_class.new(input)}

    it "raises error when initialized with an invalid hash" do
      expect{Player.new( {} )}.to raise_error(KeyError)
    end

    it "does not raise error when initialized with valid input hash" do
      expect{Player.new(input)}.to_not raise_error
    end

    it "returns the player's mark" do
      expect(player.mark).to eq(:X)
    end

end
