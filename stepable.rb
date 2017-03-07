module Stepable
  def steps
    if self.is_a?(King)
      [[0,1], [0,-1], [1,1], [1,0], [1,-1], [-1,0], [-1,1], [-1,-1]]
    elsif self.is_a?(Knight)
      [[1,-2], [2,-1], [2,1], [1,2], [-1,-2], [-2,-1], [-2,1], [-1,2]]
    end
  end

  def moves
    potential_moves = []

    directions = steps

    directions.each do |direction_coord|
      potential_moves += move_diffs(direction_coord[0], direction_coord[1])
    end

    potential_moves
  end

  private
  def move_diffs(dx, dy)
    current_xcoord, current_ycoord = self.pos

    possible_moves = []

    current_xcoord += dx
    current_ycoord += dy

    next_pos = [current_xcoord, current_ycoord]

    if current_xcoord.between?(0,7) && current_ycoord.between?(0,7) && board.null_piece?(next_pos)
      possible_moves << next_pos
    end

    possible_moves
  end
end
