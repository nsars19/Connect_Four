require './lib/board'
require_relative 'cell_spec'

describe 'Board' do
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