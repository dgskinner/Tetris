require_relative 'piece'

class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(10){ Array.new(10, " ") }
  end
  
  def clear_full_row(full_row)
    full_row.downto(1).each do |row|
      @grid[row] = @grid[row - 1]
    end
    @grid[0] = Array.new(10, " ")
  end
  
  def display
    @grid.each do |row|
      p row
    end
  end
  
  def clear_full_rows 
    cleared = false
    (0..9).each do |row|
      if @grid[row].all?{ |square| square == "X" }
        clear_full_row(row) 
        cleared = true
      end
    end
    
    cleared
  end
  
  def find_lowest_occupied_row(piece, column)
    lowest_occupied = 0
    broken = false
    (0..9).each do |row|
      (column...(column + piece.width)).each do |col|
        if @grid[row][col] == "X"
          broken = true
          break
        end
      end
      
      break if broken
      lowest_occupied += 1
    end
    
    lowest_occupied
  end
  
  def place_piece(piece, column)
    lowest_occupied = find_lowest_occupied_row(piece, column)
    piece.height.times do |row|
      piece.width.times do |col|
        @grid[lowest_occupied - piece.height + row][column + col] = piece.view[row][col]
      end
    end
  end
end