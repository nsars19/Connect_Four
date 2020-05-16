module Winnable
  def diagonal_win? line_array
    line_array.each do |line|
      next if line.size < 4
      3.times do |i|
        ['red', 'black'].each do |item|
          all_same = line[i..(i + 3)].all? { |color| color == item }
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
        4.times do |i|
          ['red', 'black'].each do |item|
            test_group = line_array[i..(i + 3)]
            if test_group.all? { |color| color == item }
              return true unless test_group.size < 4
            end
          end
        end
      end
    end
    false
  end

end