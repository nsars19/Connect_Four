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

  def place_piece player_color, choice
    @board.each do |row|
      return row[choice - 1] = Cell.new(player_color) if row[choice - 1].nil?
    end
    new_choice = self.choose_again
    place_piece(player_color, new_choice)
  end

  def choose_again
    puts "please choose another space. that column is full!"
    choice = STDIN.gets.to_i
    until choice > 0 && choice < 8
      choice = STDIN.gets.to_i
    end
    choice
  end

  def over?
    return true if self.board_full?
    [:diagonal_win?, :horizontal_win?, :vertical_win?].each do |method|
      if method == :diagonal_win?
        diags = self.get_diagonals @board
        return true if self.send(method, diags)
      else
        return true if self.send(method, @board)
      end
    end
    false
  end

  def board_full?
    Cell.count == 42 ? true : false
  end

  class Player
    attr_reader :color

    def initialize color
      @color = color
    end
  end
end