require "./lib/day2/dive"

RSpec.describe Dive do
  it "gets horizontal position" do
    horizontal = Dive.horizontal_total

    expect(horizontal).to eq 1832
  end

  it "gets depth" do
    depth = Dive.depth_total

    expect(depth).to eq 1172
  end

  it "gets total by multiplying the horizontal position and the depth" do
    total = Dive.total

    expect(total).to eq 2147104
  end
end
