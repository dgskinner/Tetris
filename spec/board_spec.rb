require 'board'

describe Board do
  describe "#initialize" do
    it "creates new board with ten by ten grid" do 
      board = Board.new
      expect(board.grid.length).to eq(10)
      board.grid.each do |row|
        expect(row.length).to eq(10)
      end
    end
  end
  
  describe "#clear_full_rows" do     
    it "clears all full rows" do
      board = Board.new
      full_rows = [6, 8, 9]
      full_rows.each do |row|
        (0..9).each{ |col| board.grid[row][col] = "X" }
      end 
      
      board.clear_full_rows
      full_rows.each do |row|
        board.grid[row].each do |square|
         expect(square).to eq(" ") 
        end
      end
    end
    
    it "cascades higher rows downward" do
      board = Board.new
      full_rows = [6, 8, 9]
      full_rows.each do |row|
        (0..9).each{ |col| board.grid[row][col] = "X" }
      end 
      
      (0..7).each{ |col| board.grid[5][col] = "X"} 
      (1..9).each{ |col| board.grid[7][col] = "X"} 
      board.display
      board.clear_full_rows
      board.display
      expect(board.grid[9]).to eq([" ", "X", "X", "X", "X", "X", "X", "X", "X", "X"])
      expect(board.grid[8]).to eq(["X", "X", "X", "X", "X", "X", "X", "X", " ", " "])
    end
    
    it "adds empty rows on top" do
      board = Board.new
      full_rows = [6, 8, 9]
      full_rows.each do |row|
        (0..9).each{ |col| board.grid[row][col] = "X" }
      end 
      
      board.clear_full_rows
      expect(board.grid.length).to eq(10)
    end
  end
end