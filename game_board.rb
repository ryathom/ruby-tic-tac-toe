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