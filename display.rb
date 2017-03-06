require "colorize"
require_relative "cursor"

class Display
  attr_reader :cursor, :board

  def initialize(board = Board.new)
    @cursor = Cursor.new([0, 0], board)
    @board = board
  end

  def render
    system("clear")
    cursor_pos = @cursor.cursor_pos

    puts "   #{(0..7).to_a.join(" ")}"
    puts "            "
    (0..7).each do |row_idx|
      row = "#{row_idx} "
      (0..7).each do |col_idx|
        pos = [row_idx, col_idx]
        piece = board[pos]
        if pos == cursor_pos
          row << " #{piece.to_s.colorize(:blue)}"
        else
          row << " #{piece.to_s}"
        end
      end
      puts row
    end
    # board[cursor_pos].colorize(:blue)
  end

  def run
    while true
      render
      cursor.get_input
    end
  end

end

display = Display.new
display.run
