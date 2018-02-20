require_relative 'piece.rb', 'null_piece.rb'

class Board
  attr_reader :board
  def initialize
    @board = Array.new(8){Array.new(8)}
    board.each_index do |row| #y
      row.each_index do |col|#x
        if row <= 1
          row[col] = Piece.new(:black, "DUMMY", [row, col])
        elsif row >= 6
          row[col] = Piece.new(:white, "DUMMY", [row, col])
        else
          row[col] = NullPiece.new
        end
      end
    end
  end

  def [](pos)
    row, col = pos
  end

  def []=(pos, val)
    row, col = pos
    board[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    begin
      if board[start_pos] == nil
        raise "Not valid start pos"
      elsif !board[end_pos].valid?
        raise "Cannot move there"
      else
        board[end_pos] = board[start_pos]
        board[start_pos] = nil
      end
    end
  end
end
