# Tetris

Run the play.rb file from the terminal to watch the computer play tetris. 
#
At the beginning of each turn, a piece is chosen at random. For the sake of simplicity, 
the only Piece classes used are Block (2x2) and Rod (4x1). If there is not a space for the next piece on the
very bottom of the grid, the computer doesn't know what to do with it (yet), so it chooses a position at random.
Members of the Piece class are able to rotate, however the computer doesn't take advantage of this.
