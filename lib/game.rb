require_relative 'board'

class Game
  attr_reader :board
  
  def initialize
    @board = Board.new
    @next_piece = random_piece
  end
  
  def display_turn 
    system("clear")
    puts "Next Piece: \n\n"
    @next_piece.display
    puts ""
    @board.display
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
  
  def play
    display_turn
    while true 
      empty_column = find_empty_column
      @board.place_piece(@next_piece, empty_column)
      display_turn
      full_rows = @board.find_full_rows
      unless full_rows.empty?
        sleep(0.2)
        @board.clear_full_rows(full_rows)
        display_turn
      end
      sleep(1)
    end
  end
  
  
  def random_piece
    case rand(2)
    when 0
      return Block.new
    when 1
      return Rod.new
    end
  end
end