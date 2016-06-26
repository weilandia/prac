class Grains
  #Grains on a chessboard
  def self.square(n)
    2 ** (n-1)
  end

  def self.total
    [*1..64].inject { |total, i| total + square(i) }
  end
end
