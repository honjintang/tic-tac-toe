require_relative 'cell'

class Grid

  attr_reader :setup

  def initialize(input = {})
    @setup = input.fetch(:setup, default)
  end

  def set_cell_mark(x, y, mark)
    get_cell(x, y).value = mark
  end

  def get_cell(x, y)
    setup[x][y]
  end

  private

  def default
    Array.new(3) { Array.new(3) { Cell.new }}
  end

end
