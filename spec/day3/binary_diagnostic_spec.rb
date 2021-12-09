require "./lib/day3/binary_diagnostic"

RSpec.describe BinaryDiagnostic do
  it "returns the correct gamma rate" do
    binary_diagnostic = BinaryDiagnostic.new

    # expect(binary_diagnostic.gamma_rate).to eq 22
    expect(binary_diagnostic.gamma_rate).to eq 218
    expect(binary_diagnostic.gamma_binary_number).to eq "000011011010"
  end

  it "returns the correct epsilon rate" do
    binary_diagnostic = BinaryDiagnostic.new
    # binary_diagnostic.generate_binary_numbers

    # expect(binary_diagnostic.epsilon_rate).to eq 9
    expect(binary_diagnostic.epsilon_rate).to eq 3877
    expect(binary_diagnostic.epsilon_binary_number).to eq "111100100101"
  end

  it "returns the correct power consumption" do
    binary_diagnostic = BinaryDiagnostic.new

    # expect(binary_diagnostic.power_consumption).to eq 198
    expect(binary_diagnostic.power_consumption).to eq 845186
  end

  it "returns the correct oxygen generator rating" do
    binary_diagnostic = BinaryDiagnostic.new
    oxygen_generator_rating = binary_diagnostic.oxygen_generator_rating

    # expect(oxygen_generator_rating).to eq 23
    expect(oxygen_generator_rating).to eq 1459
  end

  it "returns the correct CO2 scrubber rating" do
    binary_diagnostic = BinaryDiagnostic.new
    co2_scrubber_rating = binary_diagnostic.co2_scrubber_rating

    # expect(co2_scrubber_rating).to eq 10
    expect(co2_scrubber_rating).to eq 3178
  end

  it "returns the correct life support rating" do
    binary_diagnostic = BinaryDiagnostic.new

    # expect(binary_diagnostic.life_support_rating).to eq 230
    expect(binary_diagnostic.life_support_rating).to eq 4636702
  end
end
