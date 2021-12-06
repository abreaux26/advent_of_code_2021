module Dive
  extend self

  def depth_total
    down_total = sum_of_units(depth_down_data)
    up_total = sum_of_units(depth_up_data)

    (down_total - up_total).abs
  end

  def horizontal_total
    sum_of_units(horizontal_data)
  end

  def total
    depth_total * horizontal_total
  end

  private

  def sum_of_units(data)
    data.reduce(0) do |sum, position|
      sum += position.split(' ')[1].to_i
    end
  end

  def depth_down_data
    filter_data("down")
  end

  def depth_up_data
    filter_data("up")
  end

  def get_data
    @_get_data ||= File.read("./lib/day2/puzzle_input.txt").split("\n")
  end

  def horizontal_data
    filter_data("forward")
  end

  def filter_data(command_type)
    get_data.filter { |command| command.downcase.include? command_type }
  end
end
