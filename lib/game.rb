require_relative 'board'

class Game
  attr_reader :board
  
  def initialize
    @board = Board.new
    @next_piece = Block.new
  end
  
  def find_empty_column
    (0..(10 - @next_piece.width)).each do |col|
      col_empty = true
      @next_piece.width.times do |wid|
        if @board.grid.any?{ |row| row[col + wid] == "X" }
          col_empty = false
          break
        end
      end
      
      return col if col_empty
    end
    
    false
  end
end