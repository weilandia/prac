class Robot
  attr_accessor :name
  def initialize
    generate_name
  end

  def reset
    generate_name
  end

  def generate_name
    a = [*'A'..'Z'].sample(2)
    n = [*0..9].sample(3)
    self.name = (a + n).join
  end
end
