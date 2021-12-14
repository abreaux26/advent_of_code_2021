require_relative "number"

class GiantSquid
  attr_accessor :all_numbers_to_draw, :bingo_board, :bingo_number

  def initialize
    @all_numbers_to_draw = {}
    @bingo_board = []
    @bingo_number = -1
  end

  def play_bingo
    numbers_to_draw
    index = 0
    bingo = false

    until bingo
      number = numbers_to_draw[index].number.to_s
      @all_numbers_to_draw[number].mark_number
      index += 1
      bingo = bingo?
    end

    @bingo_number = number.to_i
  end

  def bingo?
    bingo = false

    boards.each do |board|
      bingo = bingo_across?(board) || bingo_down?(board)
      @bingo_board = board if bingo
      return bingo if bingo
    end

    bingo
  end

  def boards
    clean_data = get_data.map(&:clone)
    clean_data.delete("")
    clean_data.shift
    clean_data.each_slice(5).to_a
  end

  def sum_of_unmarked_numbers
    numbers = fetch_numbers_on_bingo_board
    unmarked_numbers = fetch_unmarked_numbers

    numbers.select do |number|
      unmarked_numbers.include?(number)
    end.reduce(:+)
  end

  def score
    play_bingo

    @bingo_number * sum_of_unmarked_numbers
  end

  private

  def all_marked?(numbers_to_check)
    numbers_to_check.all? do |number_to_check|
      @all_numbers_to_draw.find do |_, number|
        number.number == number_to_check.to_i
      end.last.marked?
    end
  end

  def bingo_across?(board)
    rows_for(board).each do |row|
      return all_marked?(row)
    end
  end

  def bingo_down?(board)
    columns_for(board).each do |column|
      return all_marked?(column)
    end
  end

  def columns_for(board)
    rows_for(board).transpose
  end

  def fetch_numbers_on_bingo_board
    @bingo_board.map do |row|
      row.split(" ").map { |number| number.to_i }
    end.flatten
  end

  def fetch_unmarked_numbers
    @all_numbers_to_draw
      .values
      .select(&:unmarked?)
      .map(&:number)
  end

  def get_data
    @_get_data ||= File.read("./lib/day4/puzzle_input.txt").split("\n")
  end

  def numbers_to_draw
    @_numbers_to_draw ||= get_data.first.split(",").map do |number|
      @all_numbers_to_draw[number] = Number.new(number.to_i)
    end
  end

  def rows_for(board)
    board.map { |row| row.split(' ') }
  end
end
