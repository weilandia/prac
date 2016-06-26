class Atbash
  def self.encode(text)
    text.downcase.gsub(/\W/,"").chars.map { |char|
      encode_char(char)
    }.each_slice(5).to_a.map(&:join).join(" ")
  end

  def self.encode_char(char)
    alphabet.index(char) ? alphabet[(alphabet.index(char) - 25).abs] : char
  end

  def self.alphabet
    [*"a".."z"]
  end

  def digits
    [*1..9]
  end
end
