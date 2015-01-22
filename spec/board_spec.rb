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
    subject(:board) { Board.new }
    subject(:full_rows) { [6, 8, 9] }
    
    before(:each) do 
      full_rows.each do |row|
        (0..9).each{ |col| board.grid[row][col] = "X" }
      end
    end
    
    it "clears all full rows" do
      board.clear_full_rows
      full_rows.each do |row|
        board.grid[row].each do |square|
         expect(square).to eq(" ") 
        end
      end
    end
    
    it "cascades higher rows downward" do    
      (0..7).each{ |col| board.grid[5][col] = "X"} 
      (1..9).each{ |col| board.grid[7][col] = "X"} 
      board.clear_full_rows
      expect(board.grid[9]).to eq([" ", "X", "X", "X", "X", "X", "X", "X", "X", "X"])
      expect(board.grid[8]).to eq(["X", "X", "X", "X", "X", "X", "X", "X", " ", " "])
    end
    
    it "adds empty rows on top" do
      board.clear_full_rows
      expect(board.grid.length).to eq(10)
    end
  end
end
