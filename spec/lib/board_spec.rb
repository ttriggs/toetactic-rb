require 'board'

describe Board do
  context '.new(state,turn) defaults' do
    it 'defaults #state to nine dashes' do
      expect(Board.new.state).to eq(%w(-) * Board::SIZE)
    end
    it 'defaults #turn == x' do
      expect(Board.new.turn).to eq('x')
    end
  end

  context '.new(state,turn) input arguements' do
    let(:used_board) { Board.new(%w(x - - - - - - - -),'o') }

    it 'sets @turn if passed in' do
      expect(used_board.turn).to eq('o')
    end
    it 'sets @state if passed board' do
      expect(used_board.state).to eq(%w(x - - - - - - - -))
    end
  end

  context '#move(index)' do
    let(:board) { Board.new.move(0) }
    it 'makes move for current player (x)' do
      expect(board.state).to eq(%w(x - - - - - - - -))
      expect(board.turn).to eq("o")
    end
  end

  context '#possible_moves' do
    let(:board) { Board.new.move(0) }
    it 'returns array of possible moves' do
      expect(board.move(8).possible_moves).to eq([1,2,3,4,5,6,7])
    end
  end

  context '#win?' do
    it 'finds no winner for fresh board' do
      expect(Board.new.win?("x")).to be_falsey
      expect(Board.new.win?("o")).to be_falsey
    end
    it 'finds winner in rows' do
      expect(Board.new(%w(x x x
                          - - -
                          - - -)).win?("x")).to be_truthy
      expect(Board.new(%w(- - -
                          x x x
                          - - -)).win?("x")).to be_truthy
      expect(Board.new(%w(- - -
                          - - -
                          x x x)).win?("x")).to be_truthy
    end
    it 'finds winner in cols' do
      expect(Board.new(%w(o - -
                          o - -
                          o - -)).win?("o")).to be_truthy
      expect(Board.new(%w(- o -
                          - o -
                          - o -)).win?("o")).to be_truthy
      expect(Board.new(%w(- - o
                          - - o
                          - - o)).win?("o")).to be_truthy
    end
    it 'finds winner in diagonals' do
      expect(Board.new(%w(o - -
                          - o -
                          - - o)).win?("o")).to be_truthy
      expect(Board.new(%w(- - o
                          - o -
                          o - -)).win?("o")).to be_truthy
    end
  end
end
