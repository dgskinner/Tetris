require 'piece'

describe Piece do
  it "has correct height and width" do
    custom_piece = Piece.new
    custom_piece.view = [["X", "X"], ["X", "X"], ["X", "X"]]
    expect(custom_piece.height).to eq(3)
    expect(custom_piece.width).to eq(2)
  end
  
  describe "#rotate!" do 
    it "rotates a custom piece" do 
      custom_piece = Piece.new
      custom_piece.view = [["X", "X", "X"], ["X", "X", " "], ["X", " ", " "]]
      custom_piece.rotate!
      expect(custom_piece.view).to eq([["X", "X", "X"], [" ", "X", "X"], [" ", " ", "X"]])
    end
  end
end