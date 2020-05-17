module Winnable
  def diagonal_win? diagonals
    diagonals.each do |line|
      next if line.size < 4
      3.times do |i|
        test_group = line[i..(i + 3)]
        if test_group.is_a?(Array) && test_group.size == 4
          all_same = test_group.all? { |item| item == test_group[0] }
          return true if all_same
        end
      end
    end
    false
  end

  ["horizontal_win?", "vertical_win?"].each do |method|
    define_method(method) do |board|
      # Check 4 items at a time eg. `[i..(i+3)]` for win conditions.
      # iterate over array to check all spaces. 4 times is the minimum
      # amount of steps needed to check all positions
      board.each do |line_array|
        next if line_array.all?(&:nil?)
        4.times do |i|
          next if line_array.size < 4
          test_group = line_array[i..(i + 3)]
          if test_group.all? { |color| color == line_array[i] && !color.nil? }
            return true unless test_group.size < 4
          end
        end
      end
      false
    end
  end
end