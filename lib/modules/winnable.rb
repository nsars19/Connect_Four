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

  def horizontal_win?
  end

  def vertical_win?
  end
end