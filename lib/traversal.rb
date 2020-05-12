module Traversable
  def get_left_upper_diagonals
    colors = [self.color]
    node = self
    until node.up_left.nil?
      node = node.up_left
      colors << node.color
    end
    colors
  end
end