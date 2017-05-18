require_relative 'cell'

class Grid

  attr_reader :setup

  def initialize(input = {})
    @setup = input.fetch(:setup, default)
  end

  private

  def default
    Array.new(3) { Array.new(3) { Cell.new }}
  end

end
