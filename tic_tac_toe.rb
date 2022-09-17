# frozen_string_literal: true

require_relative 'player'
require_relative 'game_board'

# Game logic
class TicTacToe
  def initialize
    welcome_msg
    register_players
    initialize_board
    @game_over = false
  end

  def play
    current_player = @player1

    while @game_over == false
      move = get_player_move(current_player)
      @board.update_board(current_player, move)
      @game_over = @board.check_for_game_over(current_player)

      current_player = toggle_player(current_player)
    end

    replay
  end

  private

  def welcome_msg
    puts '----------------------------------'
    puts '----- Welcome to Tic Tac Toe -----'
    puts '----------------------------------'
    puts nil
  end

  def initialize_board
    @board = GameBoard.new(@player1, @player2)
    @board.update_display
  end

  def register_players
    @player1 = register_single_player(1)
    @player2 = register_single_player(2)
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

  def get_player_move(player)
    puts "#{player.name}, choose a square (1-9): "

    chosen_square = check_valid_input

    until @board.check_move_is_valid(chosen_square)
      puts 'That square is taken, choose a different square (1-9):'

      chosen_square = check_valid_input
    end

    chosen_square
  end

  def check_valid_input
    chosen_square = gets.chomp.to_i

    until (chosen_square.is_a? Integer) && chosen_square.between?(1, 9)
      puts 'Sorry, invalid input. Choose a square (1-9): '
      chosen_square = gets.chomp.to_i
    end

    chosen_square
  end

  def toggle_player(current_player)
    case current_player
    when @player1
      @player2
    when @player2
      @player1
    end
  end

  def replay
    puts 'Would you like to play again? (y/n)'

    return unless gets.chomp == 'y'

    @game_over = false
    initialize_board
    play
  end
end

game = TicTacToe.new
game.play
