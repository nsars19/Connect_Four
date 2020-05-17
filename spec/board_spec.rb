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
    let(:player) { Board::Player.new('red', 1) }
    
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

    it 'does not allow a choice > 7 OR choice < 1' do
      allow($stdin).to receive(:gets).and_return("1\n")
      expect { game.place_piece('red', 10) }.to change { game.board[0][0] }.to Cell
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
    it 'returns false if no win' do
      [1, 4, 6].each do |num|
        ['black', 'red'].each do |color|
          3.times { game.place_piece(color, num) }
        end
      end
      [2, 3, 5, 7].each do |num|
        ['red', 'black'].each do |color|
          3.times { game.place_piece(color, num) }
        end
      end
      expect(game.over?).to be false
    end
  end

  describe "#board_full?" do
    it "calls .count on Cell" do
      expect(Cell).to receive(:count)
      game.board_full?
    end
    it "returns true with 42 pieces" do
      42.times { Cell.new 'ultraviolet' }
      game.board_full?
    end
    it "returns false with < 42 pieces" do
      23.times { Cell.new 'infrared' }
      game.board_full?
    end
  end

  describe '#display_board' do
    it 'outputs to stdout' do
      expect { game.display_board }.to output.to_stdout
    end
  end
end