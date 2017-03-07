require "singleton"

class Piece
  attr_reader :symbol, :color

  def initialize
    @moves = []
    @symbol = :P
    @color = :red
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
  def initialize
    super
    @symbol = :C
  end
end

class Bishop < Piece
  def initialize
    super
    @symbol = :B
  end
end

class Rook < Piece
  def initialize
    super
    @symbol = :R
  end
end

class Queen < Piece
  def initialize
    super
    @symbol = :Q
  end
end

class Knight < Piece
  def initialize
    super
    @symbol = :K
  end
end
