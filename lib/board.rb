class Board
  attr_accessor :state, :turn
  DIM = 3
  SIZE = DIM * DIM
  def initialize(state=nil, turn="x")
    @state = state || %w(-)* SIZE
    @turn = turn
  end
end
