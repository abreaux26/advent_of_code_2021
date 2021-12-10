require_relative "number"

class GiantSquid
  # extend self
  attr_accessor :all_numbers_to_draw

  def initialize
    @all_numbers_to_draw = {}
  end

  def draw_number
    numbers_to_draw
    index = 0
    bingo = false

    while bingo == false
      number = numbers_to_draw[index].number.to_s
      @all_numbers_to_draw[number].marked = true
      index += 1
      bingo = bingo?
    end

    number
  end

  def bingo?
    # checking rows only right now
    bingo = false

    boards.each do |board|
      board.each do |row|
        bingo = row.split(" ").all? do |number_to_check|
          # require "pry"; binding.pry
          @all_numbers_to_draw.find { |_, number| number.number == number_to_check.to_i }.last.marked?
        end
      end
    end

    bingo
  end

  def boards
    clean_data = get_data.map(&:clone)
    clean_data.delete("")
    clean_data.shift
    clean_data.each_slice(5).to_a
  end

  def display_boards
    grid = ""
    boards.each do |board|
      board.each do |row|
        grid += row + "\n"
      end
      grid += "\n"
    end
    grid
  end

  private

  def get_data
    @_get_data ||= File.read("./lib/day4/test_puzzle_input.txt").split("\n")
  end

  def numbers_to_draw
    @_numbers_to_draw ||= get_data.first.split(",").map do |number|
      @all_numbers_to_draw[number] = Number.new(number.to_i)
    end
  end
end
