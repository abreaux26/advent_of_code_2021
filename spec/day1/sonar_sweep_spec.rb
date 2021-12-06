require "./lib/day1/sonar_sweep"

RSpec.describe SonarSweep do
  it "gets all of the measurements" do
    measurements = SonarSweep.measurements

    expect(measurements.count).to eq 2000
  end

  it "sums all of the measurements that are larger than the previous measurement" do
    set = SonarSweep.measurements
    total = SonarSweep.total_of_increasing(set)

    expect(total).to eq 1400
  end

  it "groups all of the measurements in 3" do
    three_measurement_windows = SonarSweep.three_measurement_windows

    expect(three_measurement_windows.count).to eq 1998
  end

  it "sums all of the 3 consecutive measurements total that are larger than the previous measurement" do
    set = SonarSweep.three_measurement_windows
    three_measurement_windows = SonarSweep.total_of_increasing(set)

    expect(three_measurement_windows).to eq 1429
  end
end
