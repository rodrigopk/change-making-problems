require_relative './currency'

us_cent = Currency.new([100, 50, 25, 10, 5, 1])

RSpec.describe "Currency Class" do
  it "should handle American coins: [100, 50, 25, 10, 5, 1]" do
    expect(us_cent.num_ways(100)).to eq(293)
    
    expect(us_cent.min_change(194)).to eq(9)
  end
end