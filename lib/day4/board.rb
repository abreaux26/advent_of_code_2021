class Board
  attr_reader :bingo, :board

  def initialize(board)
    @board = board
    @bingo = false
  end

  def has_bingo?
    @bingo
  end

  def bingo!
    @bingo = true
  end
end
