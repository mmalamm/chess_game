require_relative "cursor"
require_relative "display"
require_relative "board"

class Game

  def initialize(board, cursor, display)
    @board = board
    @cursor = cursor
    @display = display
  end

  def play
    display.render
    cursor.get_input
  end 
end
