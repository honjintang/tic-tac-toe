class Player

  attr_reader :mark

  def initialize(input)
    @mark = input.fetch(:mark)
  end

end
