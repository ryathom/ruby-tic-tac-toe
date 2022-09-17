# frozen_string_literal: true

# Player class that will hold info for each of two human players
class Player
  attr_reader :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

# Tracks game board state
class GameBoard
  def initialize
    @visible_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @logic_board = Array.new(9, nil)
  end

  def display_board
    puts nil
    puts " #{@visible_board[0]} | #{@visible_board[1]} | #{@visible_board[2]}"
    puts '-----------'
    puts " #{@visible_board[3]} | #{@visible_board[4]} | #{@visible_board[5]}"
    puts '-----------'
    puts " #{@visible_board[6]} | #{@visible_board[7]} | #{@visible_board[8]}"
    puts nil
  end
end

# Game logic
class TicTacToe
  def welcome_msg
    puts '----------------------------------'
    puts '----- Welcome to Tic Tac Toe -----'
    puts '----------------------------------'
    puts nil
  end

  def register_single_player(player_id)
    puts "Player #{player_id}: Enter your name."
    name = gets.chomp
    puts 'Choose a single character to use as your game piece: '
    marker = gets.chomp

    unless marker.length == 1
      puts 'Invalid game piece, choose a single character: '
      marker = gets.chomp
    end
    puts nil

    Player.new(name, marker)
  end

  def register_players
    @player1 = register_single_player(1)
    @player2 = register_single_player(2)
  end

  def initialize_board
    @board = GameBoard.new
    @board.display_board
  end
end

game = TicTacToe.new
game.welcome_msg
game.register_players
game.initialize_board
