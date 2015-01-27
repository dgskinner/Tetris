class Strategy
  def initialize(game)
    @game = game
  end
  
  def next_piece 
    @game.next_piece
  end
  
  def board
    @game.board
  end
  
  def find_best_column
    lowest_row = 9
    empty_column = false
    while true
      empty_column = find_empty_column(lowest_row)
      break if empty_column
      lowest_row -= 1
    end
    empty_column
  end
  
  def find_empty_column(lowest_row)
    (0..(10 - next_piece.width)).each do |col|
      empty_col = empty_column(col, lowest_row)
      return empty_col if empty_col
    end
    
    false
  end
  
  def empty_column(col, lowest_row)
    col_empty = true
    next_piece.width.times do |wid|
      if board.grid[0..lowest_row].any?{ |row| row[col + wid] == "X" }
        col_empty = false
        break
      end
    end
  
    return col if col_empty
  end
end