class Knight
  attr_reader :start, :target

  def initialize(start, target)
    @start = start
    @target = target
  end

  def find_route
    node = tree_to_target(Move.new(@start))
    route = []
    while node.from != nil do
      route << node.square
      node = node.from
    end
    route << node.square
    route.reverse!
  end

  # build tree of Move nodes, using breadth first queueing, until node of
  # target square is added, and return that node. This node will link, via
  # its parents, to the start square node, thus revealing the shortest path.
  def tree_to_target(node)
    queue = [node]
    while node.square != @target do
      node = queue[0]
      find_moves(node.square).each do |move|
        new_node = Move.new(move, node)
        queue << new_node
      end
      queue = queue.drop(1)
    end
    node
  end

  def find_moves(square)
    moves = []
    deltas = [[2,1], [-2,1], [2,-1], [-2,-1], [1,2], [-1,2], [1,-2], [-1,-2]]
    deltas.each do |delta|
      move = [square[0] + delta[0], square[1] + delta[1]]
      moves << move if move[0] >= 0 && move[0] < 8 && move[1] >= 0 && move[1] < 8
    end
    moves
  end
end

class Move
  attr_reader :from, :square

  def initialize(square, from = nil)
    @square = square
    @from = from
  end
end

def algebraic(square)
  file = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']
  algebraic = square.to_s + ' ' + file[square[0]] + (square[1] + 1).to_s
end

if __FILE__ == $0
  knight = Knight.new([rand(7), rand(7)], [rand(7), rand(7)])
  route = knight.find_route

  puts "the shortest path (in number of knight moves)"
  puts "from: #{algebraic(knight.start)} to: #{algebraic(knight.target)} is #{route.length - 1} moves:"
  route.each {|square| puts "  #{algebraic(square)}"}
end

# example output: (varies every run, as start & target squares are random):

# => the shortest path (in number of knight moves)
# => from: [3, 5] d6 to: [1, 3] b4 is 4 moves:
# =>   [3, 5] d6
# =>   [1, 4] b5
# =>   [3, 3] d4
# =>   [2, 1] c2
# =>   [1, 3] b4
