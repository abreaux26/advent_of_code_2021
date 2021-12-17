class Board
  attr_reader :bingo, :board

  def initialize(board)
    @board = board
    @bingo = false
  end

  def bingo!
    @bingo = true
  end

  def bingo?
    @bingo
  end

  def numbers
    @_numbers ||= rows.flatten.map { |number| number.to_i }
  end

  def columns
    @_columns ||= rows.transpose
  end

  def rows
    @_rows ||= board.map { |row| row.split(' ') }
  end
end
