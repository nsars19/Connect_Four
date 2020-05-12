require_relative 'traversal'

class Cell
  include Traversable
  attr_accessor :up_right, :up_left, :down_right, :down_left
  attr_reader :color

  def initialize color
    @color = color
    @up_right   = nil
    @down_right = nil
    @up_left    = nil
    @down_left  = nil
  end
end