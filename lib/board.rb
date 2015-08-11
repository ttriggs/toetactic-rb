class Board
  attr_accessor :state, :turn
  DIM = 3
  SIZE = DIM * DIM
  def initialize(state=nil, turn="x")
    @state = state || %w(-) * SIZE
    @turn = turn
  end

  def move(index)
    new_board = Board.new(@state.dup, xturn("o","x"))
    new_board.state[index] = @turn
    new_board
  end

  def xturn(x, o)
    @turn == "x" ? x : o
  end

  def possible_moves
    state.map.with_index {|cell, i| i if cell == "-" }.compact
  end

  def win?(player)
    rows = state.each_slice(DIM).to_a
    rows.any? {|row| row.all? {|r| r == player } } ||
      rows.transpose.any? {|col| col.all? {|c| c == player } } ||
      rows.map.with_index.all? {|row, i| row[i] == player } ||
      rows.map.with_index.all? {|row, i| row[DIM - 1 - i] == player }
  end
end
