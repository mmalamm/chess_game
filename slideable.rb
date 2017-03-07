require 'byebug'

module Slideable
  def moves
    potential_moves = []

    directions = self.move_dirs #return either horizontal_dirs or diagonal_dirs

    directions.each do |direction_coord|
      potential_moves += grow_unblocked_moves_in_dir(direction_coord[0], direction_coord[1])
    end

    potential_moves #return valid moves
  end

  def horizontal_dirs
    [[0, 1], [1, 0], [0, -1], [-1, 0]]
  end

  def diagonal_dirs
    [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  end

  private
  def grow_unblocked_moves_in_dir(dx, dy)
    current_xcoord, current_ycoord = self.pos

    possible_moves = []

    while true
      current_xcoord += dx
      current_ycoord += dy

      next_pos = [current_xcoord, current_ycoord]

      if current_xcoord.between?(0,7) && current_ycoord.between?(0,7)
        if board.null_piece?(next_pos) || board[next_pos].color != self.color
          possible_moves << next_pos
        end 
      else
        break
      end
    end

    possible_moves
  end

end
