class Year
  VERSION = 1
  def self.leap?(y)
    return false if y % 4 != 0 || y % 100 == 0 && y % 400 != 0
    true
  end
end
