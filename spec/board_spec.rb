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
    it 'places a piece in @board'
    it 'creates a cell'
  end

  describe '#over?' do
    it 'returns true if win'
    it 'returns false if no win'
  end

  describe '#check_if_win' do
    it 'checks diagonally'
    it 'checks vertically'
    it 'checks horizontally'
  end

  describe '#display_board' do
    it 'outputs to stdout'
  end

  ["horizontals", "verticals"].each do |line|
    describe "get_#{line}" do
      it 'returns arrays with one string element'
    end
  end
end