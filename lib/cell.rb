require_relative './modules/traversal'
require_relative './modules/winnable'

class Cell
  include Traversable
  include Winnable
  attr_accessor :upper_right, :upper_left, :lower_right, :lower_left
  attr_reader :color

  def initialize color
    @color = color
    @upper_right = nil
    @lower_right = nil
    @upper_left  = nil
    @lower_left  = nil
  end
end