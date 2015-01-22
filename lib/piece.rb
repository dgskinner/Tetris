class Piece
  attr_accessor :view
  
  def height 
    @view.length
  end
  
  def width
    @view[0].length
  end
  
  def display
    @view.each do |row|
      p row
    end
  end
  
  def rotate!
    @view = @view.transpose.map{ |row| row.reverse }
  end
end