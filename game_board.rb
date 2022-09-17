# frozen_string_literal: true

# Tracks game board state
class GameBoard
  def initialize(p1, p2)
    @p1 = p1
    @p2 = p2
    @visible_board = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    @logic_board = Array.new(10, nil)
    @winning_combinations = [[1, 2, 3],
                             [4, 5, 6],
                             [7, 8, 9],
                             [1, 4, 7],
                             [2, 5, 8],
                             [3, 6, 9],
                             [1, 5, 9],
                             [3, 5, 7]]
  end

  def display_board
    clear_screen
    puts nil
    puts " #{@visible_board[1]} | #{@visible_board[2]} | #{@visible_board[3]}        #{@p1.name}: #{@p1.score}"
    puts '-----------'
    puts " #{@visible_board[4]} | #{@visible_board[5]} | #{@visible_board[6]}        #{@p2.name}: #{@p2.score}"
    puts '-----------'
    puts " #{@visible_board[7]} | #{@visible_board[8]} | #{@visible_board[9]}"
    puts nil
  end

  def check_move_is_valid(move)
    @logic_board[move].nil?
  end

  def update_board(player, move)
    @visible_board[move] = player.marker
    @logic_board[move] = player

    display_board
  end

  def clear_screen
    system "clear"
  end

  def check_for_winner(current_player)
    @winning_combinations.each do |comb|
      next unless @logic_board[comb[0]] == current_player && \
                  @logic_board[comb[1]] == current_player && \
                  @logic_board[comb[2]] == current_player

      current_player.increment_score
      display_board
      puts "#{current_player.name} is the winner!"
      return true
    end

    if @logic_board.values_at(1..9).none?(nil)
      puts "It's a tie!"
      return true
    end
    false
  end
end
