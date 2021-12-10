require "./lib/day4/giant_squid"

RSpec.describe GiantSquid do
  it "has the correct number of boards" do
    boards = GiantSquid.boards

    expect(boards.count).to eq 3
  end

  it "??" do
    gs = GiantSquid.new
    number = gs.draw_number

    # Keep getting three here and I don't know why

    expect(number).to eq 24
  end
end
