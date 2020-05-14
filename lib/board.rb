require_relative 'cell'
require_relative './modules/traversal'

class Board
  include Traversable
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7) }
  end
end