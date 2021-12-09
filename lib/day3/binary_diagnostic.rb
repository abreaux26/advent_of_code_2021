class BinaryDiagnostic
  # extend self
  attr_accessor :epsilon_binary_number, :gamma_binary_number

  def initialize
    @epsilon_binary_number = ""
    @gamma_binary_number = ""
  end

  def epsilon_rate
    generate_binary_numbers
    @epsilon_binary_number.to_i(2)
  end

  def gamma_rate
    generate_binary_numbers
    @gamma_binary_number.to_i(2)
  end

  def power_consumption
    epsilon_rate * gamma_rate
  end

  private

  def column_data
    get_data.map do |row|
      row.split('')
    end.transpose
  end

  def generate_binary_numbers
    @_generate_binary_numbers ||= column_data.each do |column|
      number_of_zeros = column.count("0")
      number_of_ones = column.count("1")

      if number_of_ones > number_of_zeros
        @gamma_binary_number += "1"
        @epsilon_binary_number += "0"
      else
        @gamma_binary_number += "0"
        @epsilon_binary_number += "1"
      end
    end
  end

  def get_data
    @_get_data ||= File.read("./lib/day3/puzzle_input.txt").split
  end
end
