# frozen_string_literal: true

# Tracks game board state
class GameBoard
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @visible_board = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @logic_board = Array.new(10, nil)
    @winning_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                             [1, 4, 7], [2, 5, 8], [3, 6, 9],
                             [1, 5, 9], [3, 5, 7]]
  end

  def update_display
    clear_display
    puts nil
    display_board
    puts nil
    display_scores
  end

  def display_board
    puts " #{@visible_board[1]} | #{@visible_board[2]} | #{@visible_board[3]}"
    puts '-----------'
    puts " #{@visible_board[4]} | #{@visible_board[5]} | #{@visible_board[6]}"
    puts '-----------'
    puts " #{@visible_board[7]} | #{@visible_board[8]} | #{@visible_board[9]}"
  end

  def display_scores
    puts "#{@player1.name}: #{@player1.score}"
    puts "#{@player2.name}: #{@player2.score}"
    puts nil
  end

  def clear_display
    system 'clear'
  end

  def check_move_is_valid(move)
    @logic_board[move].nil?
  end

  def update_board(player, move)
    @visible_board[move] = player.marker
    @logic_board[move] = player

    update_display
  end

  def check_for_game_over(current_player)
    if check_for_winner(current_player)
      true
    elsif check_for_stalemate
      true
    else
      false
    end
  end

  def check_for_stalemate
    if @logic_board.values_at(1..9).none?(nil)
      puts "It's a tie!"
      true
    else
      false
    end
  end

  def check_for_winner(current_player)
    @winning_combinations.each do |comb|
      next unless @logic_board[comb[0]] == current_player && \
                  @logic_board[comb[1]] == current_player && \
                  @logic_board[comb[2]] == current_player

      current_player.increment_score
      update_display
      puts "#{current_player.name} is the winner!"
      return true
    end
    false
  end
end
