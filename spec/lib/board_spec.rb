require 'board'

describe Board do
  let(:new_board) { Board.new }
  let(:used_board) { Board.new(%w(x - - - - - - - -),'o') }

  describe '.new(state,turn)' do
    it 'defaults #state to nine dashes' do
      expect(new_board.state).to eq(%w(-) * Board::SIZE)
    end
    it 'defaults #turn == x' do
      expect(new_board.turn).to eq('x')
    end
    it 'sets @turn if passed in' do
      expect(used_board.turn).to eq('o')
    end
    it 'sets @state if passed board' do
      expect(used_board.state).to eq(%w(x - - - - - - - -)) 
    end
  end

  describe '#move(index)' do
  end
end
