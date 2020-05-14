module Traversable
  ["upper", "lower"].each do |up_down|
    ["left", "right"].each do |left_right|
      define_method("get_#{up_down}_#{left_right}_diagonals") do
        colors = [self.color]
        node = self
        until node.send("#{up_down}_#{left_right}").nil?
          node = node.send("#{up_down}_#{left_right}")
          colors << node.color
        end
        colors
      end
    end
  end

  def get_diagonals
  end

  def combine_diagonals upper, lower
    # Reverse an array so they each 'point' the same direction
    upper = upper.reverse
    # Remove initial piece from one array so it is not counted twice 
    combined_diagonal = upper + lower[1..-1]
  end

  def get_horizontals board_array
    rows = []
    board_array.each do |row|
      row.each { |node| rows << node.color }
    end
    rows
  end

  def get_verticals board_array
    columns = []
    board_array.each do |column|
      column.each { |node| columns << node.color }
    end
    columns
  end
end