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

  def game_over
    return :winner if winner?
    return :draw if draw?
  end

  def winner?
    complete_row? || complete_column? || right_diagonal? || left_diagonal?
  end

  def draw?
    setup.flatten.none? { |cell| cell.value == nil }
  end

  private

  def default
    Array.new(3) { Array.new(3) { Cell.new }}
  end

  def complete_row?
    setup.any? do |row|
       cells = [row[0], row[1], row[2]]
       same_and_not_nil?(cells)
     end
  end

  def complete_column?
    (0...setup.length).any? do |column|
      cells = [setup[0][column], setup[1][column], setup[2][column]]
      same_and_not_nil?(cells)
    end
  end

  def right_diagonal?
    cells = [get_cell(0,0), get_cell(1,1), get_cell(2,2)]
    same_and_not_nil?(cells)
  end

  def left_diagonal?
    cells = [get_cell(0,2), get_cell(1,1), get_cell(2,0)]
    same_and_not_nil?(cells)
  end

  def same_and_not_nil?(cells)
    same?(cells) && not_nil?(cells)
  end

  def same?(cells)
    values = []
    cells.each do |cell|
      values.push(cell.value)
    end
    values.uniq.length == 1
  end

  def not_nil?(cells)
    values = []
    cells.each do |cell|
      values.push(cell.value)
    end
    values.compact.length == 3
  end
end
