require "singleton"
require_relative "slideable"
require_relative "stepable"

class Piece
  attr_reader :symbol, :color, :board
  attr_accessor :pos

  def initialize(color, pos, board)
    @moves = []
    @symbol = :P
    @color = :red
    @pos = pos
    @board = board
  end

  def to_s
    symbol.to_s
  end

  def empty?(pos)
  end

  def valid_moves(pos)
  end

  private
  def move_into_check(to_pos)
  end

end

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = :_
    @color = :green
  end

end

class Pawn < Piece
end

class King < Piece
  include Stepable

  def initialize(*args)
    super
    @symbol = :C
  end

end

class Bishop < Piece
  include Slideable

  def initialize(*args)
    super
    @symbol = :B
  end

  def move_dirs
    diagonal_dirs
  end
end

class Rook < Piece
  include Slideable

  def initialize(*args)
    super
    @symbol = :R
  end

  def move_dirs
    horizontal_dirs
  end
end
#
# r = Rook.new([0,0], :black)
# r.moves

class Queen < Piece
  include Slideable

  def initialize(*args)
    super
    @symbol = :Q
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end
end

class Knight < Piece
  include Stepable

  def initialize(*args)
    super
    @symbol = :K
  end
end
