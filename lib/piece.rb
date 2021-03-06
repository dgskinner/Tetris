class Piece
  attr_accessor :view
  
  def display
    @view.each do |row|
      p row
    end
  end
  
  def height 
    @view.length
  end
  
  def rotate!
    @view = @view.transpose.map{ |row| row.reverse }
  end
  
  def width
    @view[0].length
  end
end

class Block < Piece 
  def initialize
    @view = [["X", "X"], ["X", "X"]] 
  end
end

class Rod < Piece
  def initialize
    @view = [["X"], ["X"], ["X"], ["X"]]
  end
end

class LeftEl < Piece
  def initialize
    @view = [["X", " "], ["X", " "], ["X", "X"]]
  end
end

class RightEl < Piece
  def initialize
    @view = [[" ", "X"], [" ", "X"], ["X", "X"]]
  end
end

class Zig < Piece
  def initialize
    @view = [["X", "X", " "], [" ", "X", "X"]]
  end
end

class Zag < Piece
  def initialize
    @view = [[" ", "X", "X"], ["X", "X", " "]]
  end
end

class Tee < Piece
  def initialize
    @view = [[" ", "X", " "], ["X", "X", "X"]]
  end
end