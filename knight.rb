class Knight
  attr_accessor :start, :target

  def initialize
    @start = [rand(7), rand(7)]
    @target = [rand(7), rand(7)]
    find_moves
  end

  def find_moves
    delta = [2, 1]
    new = []
    to = []
    2.times do |i|
      4.times do |j|
        delta[0] = delta[0] * -1
        delta[1] = delta[1] * -1 if j % 2 == 0
        new = [@start[0] + delta[0], @start[1] + delta[1]]
        to << new if new[0] >= 0 && new[0] < 8 && new[1] >= 0 && new[1] < 8
      end
      delta.reverse!
    end
    to
  end
end

class Move
  attr_accessor :from, :to

  def initialize(from = nil)
    @from = from
    @to = []
  end
end


knight = Knight.new
p knight.start
p knight.find_moves
