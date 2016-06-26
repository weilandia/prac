class Brackets
  VERSION = 1
  def self.paired?(input)
    input.gsub!(/[^(){}\[\]]/, "")
    return true if input == ""
    if brackets[input[0]] == input[1]
      input.slice!(0..1)
      self.paired?(input)
    elsif brackets[input[0]] == input[-1]
      input.slice!(0); input.slice!(-1)
      self.paired?(input)
    else
      return false
    end
  end

  def self.brackets
    {
      "[" => "]",
      "(" => ")",
      "{" => "}",
    }
  end
end
