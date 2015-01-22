class Board
  attr_reader :grid
  
  def initialize
    @grid = Array.new(10){ Array.new(10, " ") }
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
end