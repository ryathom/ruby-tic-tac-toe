# frozen_string_literal: true

require_relative 'player'
require_relative 'game_board'

# Game logic
class TicTacToe
  def initialize
    welcome_msg
    register_players
    initialize_board
  end

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

  # Asks player to pick a square and returns their choice as an integer
  def get_player_move(player)
    puts "#{player.name}, choose a square (1-9): "
    chosen_square = gets.chomp.to_i

    until (chosen_square.is_a? Integer) && chosen_square.between?(1, 9)
      puts 'Sorry, invalid input. Choose a square (1-9): '
      chosen_square = gets.chomp.to_i
    end

    chosen_square
  end
end

game = TicTacToe.new
