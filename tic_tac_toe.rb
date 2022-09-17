# frozen_string_literal: true

require_relative 'player'
require_relative 'game_board'

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
