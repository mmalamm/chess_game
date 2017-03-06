require_relative "piece.rb"
require "colorize"


class Board

  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { NullPiece.new } }

    populate_board
  end

  def populate_board
    board.each_with_index do |row, idx|
      next if idx.between?(2, 5)
      row.each_index do |square_idx|
        row[square_idx] = Piece.new
      end
    end
  end

  def []=(pos, value)
    row, col = pos
    board[row][col] = value
  end

  def [](pos)
    row, col = pos
    board[row][col]
  end

  def move_piece(start_pos, end_pos)
    raise InvalidMove.new("There is no piece at the starting position!") if self[start_pos].is_a?(NullPiece)
    raise InvalidMove.new("That is not a valid ending position!") unless valid_move?(start_pos, end_pos)

    if self[end_pos].is_a?(NullPiece)
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
      #If self[end_pos].color == "enemy color" ???
    end
  end

  def in_bounds?(final_pos)
    final_pos.all? {|el| el.between?(0,7) }
  end

  def valid_move?(start_pos, end_pos)

  end

end

class InvalidMove < StandardError
end
