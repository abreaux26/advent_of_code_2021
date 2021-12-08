require "./lib/day2/dive"

RSpec.describe Dive do
  it "gets horizontal position" do
    # horizontal = Dive.new.horizontal
    dive = Dive.new
    dive.plan_course

    expect(dive.horizontal).to eq 1832
    # expect(dive.horizontal).to eq 15
  end

  it "gets depth" do
    # depth = Dive.new.depth
    dive = Dive.new
      dive.plan_course

    # expect(dive.depth).to eq 1172 # part 1
    # expect(dive.depth).to eq 60 # test data
    expect(dive.depth).to eq 1116059 # part 2
  end

  it "gets total by multiplying the horizontal position and the depth" do
    dive = Dive.new
    dive.plan_course

    # expect(dive.total).to eq 2147104 # part 1
    # expect(dive.total).to eq 900 # test data
    expect(dive.total).to eq 2044620088 # part 2
  end

  it "gets aim" do
    dive = Dive.new
    dive.plan_course

    # expect(dive.aim).to eq 10 # test data
    expect(dive.aim).to eq 1172 # part 2
  end
end
