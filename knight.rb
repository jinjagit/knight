class Knight
  def initialize
    @start = [rand(7), rand(7)]
    @target = [rand(7), rand(7)]
  end

  def find_moves(square)
    delta = [2, 1]
    new = []
    to = []
    2.times do |i|
      4.times do |j|
        delta[0] = delta[0] * -1
        delta[1] = delta[1] * -1 if j % 2 == 0
        new = [square[0] + delta[0], square[1] + delta[1]]
        to << new if new[0] >= 0 && new[0] < 8 && new[1] >= 0 && new[1] < 8
      end
      delta.reverse!
    end
    to
  end

  def find_route
    node = Move.new(@start)
    node = tree_to_target(node)
    route = []
    while node.from != nil do
      route << node.square
      node = node.from
    end
    route << node.square
    route.reverse!
    puts "the shortest path (in number of knight moves)"
    puts "from: #{algebraic(@start)} to: #{algebraic(@target)} is #{route.length - 1} moves:"
    route.each {|e| puts "  #{algebraic(e)}"}
  end

  def tree_to_target(node)
    queue = [node]
    while node.square != @target do
      node = queue[0]
      square = node.square
      find_moves(square).each do |e|
        new = Move.new(e, node)
        queue << new
      end
      queue = queue.drop(1)
    end
    node
  end

  def algebraic(square)
    file = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
    algebraic = square.to_s + ' ' + file[square[0]] + (square[1] + 1).to_s
  end
end

class Move
  attr_reader :from, :square

  def initialize(square, from = nil)
    @square = square
    @from = from
  end
end

knight = Knight.new
knight.find_route

# example output: (varies every run, as start & target squares are random):

# => the shortest path (in number of knight moves)
# => from: [3, 5] d6 to: [1, 3] b4 is 5 moves:
# =>   [3, 5] d6
# =>   [1, 4] b5
# =>   [3, 3] d4
# =>   [2, 1] c2
# =>   [1, 3] b4
