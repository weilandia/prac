class Queens
  attr_reader :white, :black
  def initialize(positions = {white: [0, 3], black: [7, 3]})
    raise ArgumentError if positions[:white] == positions[:black]
    @white = positions[:white]
    @black = positions[:black]
    @board = place_pieces(build_board)
  end

  def attack?
    return true if @white[0] == @black[0]
    return true if @white[1] == @black[1]
    return true if @white[0] - @white[1] == @black[0] - @black[1]
    return true if @white[0] + @white[1] == @black[0] + @black[1]
    false
  end

  def build_board
    Array.new(8) { Array.new(8) { "_" } }
  end

  def place_pieces(board)
    board[@white.first][@white.last]  = "W"
    board[@black.first][@black.last] = "B"
    board
  end

  def to_s
    @board.map { |row| row.join(" ").rstrip }.join("\n")
  end
end
