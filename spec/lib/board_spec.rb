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
end
