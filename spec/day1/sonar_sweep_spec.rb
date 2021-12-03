require "./lib/day1/sonar_sweep"

RSpec.describe SonarSweep do
  it "gets all of the measurements" do
    measurements = SonarSweep.measurements

    expect(measurements.count).to eq 2000
  end

  it "sums all of the measurements that are larger than the previous measurement" do
    total = SonarSweep.total_of_increasing_measurements

    expect(total).to eq 1400
  end
end
