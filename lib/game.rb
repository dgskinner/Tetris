require_relative 'board'

class Game
  attr_reader :board
  attr_writer :next_piece
  
  def initialize
    @board = Board.new
    @next_piece = random_piece
  end
  
  def display_turn 
    @next_piece = random_piece
    system("clear")
    puts "Next Piece: \n\n"
    @next_piece.display
    (5 - @next_piece.height).times do 
      puts ""
    end
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
      if empty_column
        @board.place_piece(@next_piece, empty_column)
      else
        @board.place_piece(@next_piece, rand(9))
      end
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
      Block.new
    when 1
      Rod.new
    end
  end
end