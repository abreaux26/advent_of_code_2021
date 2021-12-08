class Dive
  attr_accessor :aim, :depth, :horizontal

  def initialize
    @aim = 0
    @depth = 0
    @horizontal = 0
  end

  def plan_course
    get_data.each do |command_and_units|
      command, units = command_and_units.split(' ')

      calculate_units(command, units.to_i)
    end
  end

  def total
    @depth * @horizontal
  end

  private

  def calculate_units(command, units)
    case command
    when "forward"
      @horizontal += units
      @depth += @aim * units
    when "up"
      @aim -= units
    when "down"
      @aim += units
    end
  end

  def get_data
    @_get_data ||= File.read("./lib/day2/puzzle_input.txt").split("\n")
  end
end
