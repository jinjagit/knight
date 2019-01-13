deltas.each do |e|
  move = [(square[0] + delta[0]), (square[1] + delta[1])]
  moves << move if move[0] >= 0 && move[0] < 8 && move[1] >= 0 && move[1] < 8
end
