require './lib/board'
require_relative 'cell_spec'

describe 'Board' do
  let(:game) { Board.new }

  context 'when initialized' do
    it 'creates 6 nested arrays' do
      expect(game.board.size).to eql 6
    end

    it 'has nested arrays with size 7' do
      all_sizes_7 = game.board.map(&:size).all?(7)
      expect(all_sizes_7).to be true
    end
  end

  describe '#place_piece' do
    it 'places a piece'
    it 'creates a cell'
  end

  describe '#over?' do
    it 'returns true if win'
    it 'returns false if no win'
  end

  describe '#check_if_win' do
    it 'accepts a block'
    it 'checks diagonally'
    it 'checks vertically'
    it 'checks horizontally'
  end

  describe '#display_board' do
    it 'outputs to stdout'
  end
end