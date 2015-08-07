require 'board'

describe Board do
  let(:new_board) { Board.new }

  describe 'new' do
    it 'sets #state to nine dashes' do
      expect(new_board.state).to eq(%w(-) * Board::SIZE)
    end
    it 'sets #turn == x' do
      expect(new_board.turn).to eq('x')
    end
  end
end
