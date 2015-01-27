require_relative 'board'
require_relative 'strategy'

class Game
  attr_reader :board
  attr_accessor :next_piece
  
  def initialize
    @board = Board.new
    @next_piece = random_piece
    @strategy = Strategy.new(self)
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
  
  def play
    display_turn
    while true 
      @board.place_piece(@next_piece, @strategy.find_best_column)
      display_turn
      full_rows = @board.find_full_rows
      unless full_rows.empty?
        sleep(0.25)
        @board.clear_full_rows(full_rows)
        display_turn
      end
      sleep(0.75)
    end
  end
  
  # def place_piece_randomly
  #   @board.place_piece(@next_piece, rand(11 - @next_piece.width))
  # end
  
  def random_piece
    case rand(2)
    when 0
      Block.new
    when 1
      Rod.new
    end
  end
end