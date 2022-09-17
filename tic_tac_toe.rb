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
end

# Game logic
class TicTacToe
  def welcome_msg
    puts '----------------------------------'
    puts '----- Welcome to Tic Tac Toe -----'
    puts '----------------------------------'
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

    Player.new(name, marker)
  end

  def register_players
    @player1 = register_single_player(1)
    @player2 = register_single_player(2)
  end
end

game = TicTacToe.new
game.welcome_msg
game.register_players
