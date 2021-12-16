require_relative "board"
require_relative "number"

class GiantSquid
  attr_accessor :all_numbers_to_draw, :bingo_boards, :bingo_number

  def initialize
    @all_numbers_to_draw = {}
    @bingo_boards = []
    @bingo_number = -1
  end

  def boards
    @_boards ||= begin
      clean_data = get_data.map(&:clone)
      clean_data.delete("")
      clean_data.shift
      clean_data.each_slice(5).to_a.map do |board|
        Board.new(board)
      end
    end
  end

  def giant_squid_bingo
    play_bingo(:giant_squid_condition)
  end

  def giant_squid_score
    score(:giant_squid_bingo)
  end

  def passenger_bingo
    play_bingo(:bingo?)
  end

  def passenger_score
    score(:passenger_bingo)
  end

  def sum_of_unmarked_numbers(board)
    numbers = fetch_numbers_on_bingo_board(board)
    unmarked_numbers = fetch_unmarked_numbers

    numbers.select do |number|
      unmarked_numbers.include?(number)
    end.reduce(:+)
  end

  private

  def all_marked?(numbers_to_check)
    numbers_to_check.all? do |number_to_check|
      @all_numbers_to_draw.find do |_, number|
        number.number == number_to_check.to_i
      end.last.marked?
    end
  end

  def bingo?
    bingo = false

    boards.each do |board|
      bingo = bingo_across?(board) || bingo_down?(board)

      if bingo
        board.bingo!
        @bingo_boards << board if !@bingo_boards.include?(board)
      end
    end

    bingo
  end

  def bingo_across?(board)
    require "pry";binding.pry if @all_numbers_to_draw["21"].marked?
    rows_for(board).any? do |row|
      all_marked?(row)
    end
  end

  def bingo_down?(board)
    require "pry";binding.pry if @all_numbers_to_draw["21"].marked?

    columns_for(board).any? do |column|
      all_marked?(column)
    end
  end

  def columns_for(board)
    rows_for(board).transpose
  end

  def fetch_numbers_on_bingo_board(board)
    board.board.map do |row|
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

  def giant_squid_condition
    boards.all?(&:has_bingo?)
  end

  def numbers_to_draw
    @_numbers_to_draw ||= get_data.first.split(",").map do |number|
      @all_numbers_to_draw[number] = Number.new(number.to_i)
    end
  end

  def play_bingo(condition)
    numbers_to_draw
    index = 0

    until send(condition)
      number = numbers_to_draw[index].number.to_s
      @all_numbers_to_draw[number].mark_number
      @bingo_number = number.to_i if bingo?
      index += 1
    end
  end

  def rows_for(board)
    board.board.map { |row| row.split(' ') }
  end

  def score(player_bingo)
    send(player_bingo)

    case player_bingo
    when :passenger_bingo
      board = @bingo_boards.first
    when :giant_squid_bingo
      board = @bingo_boards.last
    end

    @bingo_number * sum_of_unmarked_numbers(board)
  end
end
