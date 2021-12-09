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

  it "returns 7" do
    binary_diagnostic = BinaryDiagnostic.new
    ogr = binary_diagnostic.oxygen_generator_rating

    expect(ogr).to eq 23
  end
end
