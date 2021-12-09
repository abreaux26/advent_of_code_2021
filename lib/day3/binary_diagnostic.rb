class BinaryDiagnostic
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

  def oxygen_generator_rating
    index = 0
    column = column_data(get_data)[index]
    new_data = new_column_data(column, index, get_data)

    until new_data.count == 1
      index += 1
      column = column_data(new_data)[index]
      new_data = new_column_data(column, index, new_data)
    end

    new_data.first.to_i(2)
  end

  def new_column_data(column, index, data)
    max_count = column.tally.values.max
    number_of_zeros = column.count("0")
    number_of_ones = column.count("1")

    bit_number = if number_of_zeros == number_of_ones
      "1"
    else
      column.tally.key(max_count)
    end

    data.select { |row| row[index] == bit_number }.first(max_count)
  end

  private

  def column_data(data)
    data.map do |row|
      row.split('')
    end.transpose
  end

  def generate_binary_numbers
    @_generate_binary_numbers ||= column_data(get_data).each do |column|
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
    @_get_data ||= File.read("./lib/day3/test_puzzle_input.txt").split
  end
end
