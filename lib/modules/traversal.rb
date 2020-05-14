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

  def get_horizontals board_array
    rows = []
    board_array.each do |row|
      rows << row.join
    end
    rows
  end

  def get_verticals board_array
    columns = []
    board_array.each do |column|
      columns << column.join
    end
    columns
  end
end