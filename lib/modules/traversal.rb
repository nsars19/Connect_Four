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
    up_left   = self.get_upper_left_diagonals
    up_right  = self.get_upper_right_diagonals
    low_left  = self.get_lower_left_diagonals
    low_right = self.get_lower_right_diagonals
    first_diagonal  = combine_diagonals(up_left, low_right)
    second_diagonal = combine_diagonals(up_right, low_left)
    [first_diagonal, second_diagonal]
  end

  def combine_diagonals upper, lower
    # Reverse an array so they each 'point' the same direction
    # Remove initial piece from one array so it is not counted twice 
    lower[1..-1].reverse + upper
  end

  def get_horizontals board_array
    rows = []
    board_array.each do |row|
      colors = []
      row.each { |node| colors << node.color }
      rows << [colors.join(' ')]
    end
    rows
  end

  def get_verticals board_array
    columns = []
    7.times do |horz_idx|
      colors = []
      6.times do |vert_idx|
        colors << board_array[vert_idx][horz_idx].color
      end
      columns << [colors.join(' ')]
    end
    columns
  end
end