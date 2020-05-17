require './lib/board'

describe 'Board' do
  let(:game) { Board.new }

  context 'when initialized' do
    it '@board has 6 nested arrays' do
      expect(game.board.size).to eql 6
    end

    it '@board has 6 nested arrays with size 7' do
      all_sizes_7 = game.board.map(&:size).all?(7)
      expect(all_sizes_7).to be true
    end
  end

  describe '#place_piece' do
    let(:cell) { Cell.new 'black' }
    let(:player) { Board::Player.new('red') }
    
    it 'places a piece in @board' do
      spot = game.board[0][4]
      expect { game.place_piece(player.color, 5) }.to change { game.board[0][4] }.from(nil).to(Cell)
    end
    it 'creates one cell' do
      expect { game.place_piece(player.color, 2) }.to change { Cell.count }.by(1)
    end
    it 'calls itself with a new selection if column is full' do
      6.times { |i| game.board[i][4] = Cell.new 'red' }
      allow(STDIN).to receive(:gets).and_return("1\n")
      expect { game.place_piece('red', 5) }.to change { game.board[0][0] }.to Cell
    end
  end

  describe '#over?' do
    it 'returns true if win' do
      (1..4).each do |num|
        num.times { game.place_piece 'red', num }
      end
      diags = game.get_diagonals game.board
      expect(game.over?).to be true
    end
    it 'returns false if no win'
  end

  describe '#display_board' do
    it 'outputs to stdout'
  end
end