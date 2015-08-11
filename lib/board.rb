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
end
