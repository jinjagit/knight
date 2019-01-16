require './knight'

describe "#find_moves" do
  it "returns all knight moves" do
    knight = Knight.new([1, 2], [4, 4])
    expect(knight.find_moves([4, 3])).to eql([[6, 4], [2, 4], [6, 2], [2, 2], [5, 5], [3, 5], [5, 1], [3, 1]])
  end
  it "returns only legal knight moves" do
    knight = Knight.new([1, 2], [4, 4])
    expect(knight.find_moves([1, 2])).to eql([[3, 3], [3, 1], [2, 4], [0, 4], [2, 0], [0, 0]])
  end
end

describe "#find_route" do
  it "returns shortest route in knight moves" do
    knight = Knight.new([1, 2], [6, 6])
    expect(knight.find_route).to eql([[1, 2], [3, 3], [5, 4], [6, 6]])
  end
  it "returns 0 moves if start == target square" do
    knight = Knight.new([1, 2], [1, 2])
    expect(knight.find_route).to eql([[1, 2]])
  end
end
