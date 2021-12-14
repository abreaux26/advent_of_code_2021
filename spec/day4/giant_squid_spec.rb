require "./lib/day4/giant_squid"

RSpec.describe GiantSquid do
  it "has the correct number of boards" do
    gs = GiantSquid.new
    boards = gs.boards

    # expect(boards.count).to eq 3
    expect(boards.count).to eq 100
  end

  it "returns last number marked that created a bingo" do
    gs = GiantSquid.new
    gs.play_bingo

    # expect(gs.bingo_number).to eq 24
    expect(gs.bingo_number).to eq 21
  end

  it "returns the sum of the unmarked numbers" do
    gs = GiantSquid.new
    gs.play_bingo

  # expect(gs.sum_of_unmarked_numbers).to eq 188
  expect(gs.sum_of_unmarked_numbers).to eq 794
  end

  it "returns the score" do
    gs = GiantSquid.new
    score = gs.score

    # expect(score).to eq 4512
    expect(score).to eq 16674
  end
end
