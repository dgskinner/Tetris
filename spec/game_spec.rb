require 'game'

describe Game do
  describe "#find_empty_column" do
    subject(:game) { game = Game.new }

    it "chooses column 0 when the grid is empty" do
      expect(game.find_empty_column).to eq(0)
    end
    
    it "chooses the first empty column when the grid is not empty" do
      game.board.place_piece(Block.new, 0)
      expect(game.find_empty_column).to eq(2)
    end
  end
end