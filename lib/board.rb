#!/usr/bin/env ruby

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

  def self.play
    game = Board.new
    player1 = Player.new '⚪', 1
    player2 = Player.new '⚫', 2

    until game.over?
      [player1, player2].each do |player|
        puts "Player #{player.number} ( #{player.color}) It's your turn! Pick a spot from 1 - 7"
        choice = gets.to_i
        while choice > 7 || choice < 1
         choice = game.choose_again
        end
        game.place_piece(player.color, choice)
        break if game.over?
        game.display_board
      end
    end
    game.display_board  
    puts "GAME OVER!!"
  end

  def place_piece player_color, choice
    choice = (choice > 7 || choice < 1) ? choose_again : choice
    @board.each do |row|
      return row[choice - 1] = Cell.new(player_color) if row[choice - 1].nil?
    end
    new_choice = self.choose_again
    place_piece(player_color, new_choice)
  end
  
  def over?
    %w[diagonal horizontal vertical].each do |method|
      lines = self.send("get_#{method}s", @board)
      return true if self.send("#{method}_win?", lines)
    end
    return true if board_full?
    false
  end

  def display_board
    puts " " + "_" * 24
    @board.reverse.each do |row|
      print "||".rjust 3
      row.each do |item|
        print "  |" if item.nil? 
        print "#{item.color}|" if item.is_a? Cell
      end
      puts "|"
    end
    puts " " + "-".*(24).rjust(12)
    return nil
  end

  def choose_again
    puts "please choose another space"
    choice = STDIN.gets.to_i
    until choice > 0 && choice < 8
      choice = STDIN.gets.to_i
    end
    choice
  end

  def board_full?
    Cell.count == 42 ? true : false
  end

  class Player
    attr_reader :color, :number

    def initialize color, number
      @color = color
      @number = number
    end
  end
end

Board.play