module SonarSweep
  extend self

  def measurements
    get_data.map do |measurement|
      measurement.to_i
    end
  end

  def total_of_increasing_measurements
    sum = 0
    measurements.each_with_index do |_, index|
      if measurements[index + 1].nil?
        return sum
      elsif measurements[index] < measurements[index + 1]
        sum += 1
      end
    end
  end

  private

  def get_data
    file_data = File.read("./lib/day1/puzzle_input.txt").split
  end
end
