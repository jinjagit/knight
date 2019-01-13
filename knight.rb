class Moves
  attr_accessor :from, :to

  def initialize(from)
    @from = from
    @to = []
    find_moves
  end

  def find_moves
    delta = [2, 1]
    new = []
    2.times do |i|
      4.times do |j|
        delta[0] = delta[0] * -1
        delta[1] = delta[1] * -1 if j % 2 == 0
        new = [@from[0] + delta[0], @from[1] + delta[1]]
        @to << new if new[0] >= 0 && new[0] < 8 && new[1] >= 0 && new[1] < 8
      end
      delta.reverse!
    end
  end
end


start = [rand(7), rand(7)]
p start
move = Moves.new(start)
p move.to
