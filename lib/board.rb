require_relative 'cell'
require_relative './modules/traversal'
require_relative './modules/winnable'

class Board
  include Traversable
  include Winnable
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7) }
  end
end