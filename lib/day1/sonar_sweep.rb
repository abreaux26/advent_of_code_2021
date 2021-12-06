module SonarSweep
  extend self

  def measurements
    get_data.map do |measurement|
      measurement.to_i
    end
  end

  def three_measurement_windows
    measurements.each_cons(3).map do |measurements|
      measurements.reduce(:+)
    end
  end

  def total_of_increasing(set)
    sum = 0
    set.each_with_index do |_, index|
      if set[index + 1].nil?
        return sum
      elsif set[index] < set[index + 1]
        sum += 1
      end
    end
  end

  private

  def get_data
    @_get_data ||= File.read("./lib/day1/puzzle_input.txt").split
  end
end
