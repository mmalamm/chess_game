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
          if @cursor.selected && !board.null_piece?(pos)
            row << " #{piece.to_s.colorize(:blue)}"
          else
            row << " #{piece.to_s.colorize(piece.color)}"
          end
        else
          row << " #{piece.to_s}"
        end
      end

      puts row
    end
  end

  def run
    while true
      render
      cursor.get_input
    end
  end

  # def posit
  #   (0..7).each do |row_idx|
  #     (0..7).each do |col_idx|
  #       pos = [row_idx, col_idx]
  #       piece = board[pos]
  #       puts "#{piece}:  #{piece.pos}"
  #     end
  #   end
  # end

end

display = Display.new
display.render
# p "#{display.board[[0,4]]}: #{display.board[[0,4]].moves}"
# p "#{display.board[[0,6]]}: #{display.board[[0,6]].moves}"
# p "#{display.board[[0,0]]}: #{display.board[[0,0]].moves}"

display.run

# display.posit
