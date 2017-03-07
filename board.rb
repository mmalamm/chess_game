require_relative "piece.rb"
require "colorize"
require "byebug"


class Board
  attr_accessor :board

  CHESS_PIECES = {
    Rook =>   [[0,0], [0,7], [7,0], [7,7]],
    Knight => [[0,1], [0,6], [7,1], [7,6]],
    Bishop => [[0,2], [0,5], [7,2], [7,5]],
    Queen =>  [[0,3], [7,3]],
    King =>   [[0,4], [7,4]],
    Pawn =>   [[1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7],
               [6,0], [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7]]
  }

  def initialize
    @board = Array.new(8) { Array.new(8) { NullPiece.instance } }

    populate_board
  end

  def populate_board
    board.each_with_index do |row, idx|
      next if idx.between?(2,5)
      row.each_index do |piece_idx|
        # debugger
        row[piece_idx] = find_piece([idx, piece_idx])

      end
    end
  end

  def find_piece(piece_idx)
    CHESS_PIECES.each do |piece, pos_array|
      # debugger
      if pos_array.include?(piece_idx)
        # debugger
        return piece.new
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
