class Pangram
  VERSION = 1
  def self.is_pangram?(sentence)
    parse(sentence) == alphabet
  end

  def self.parse(sentence)
    sentence.gsub(/\W/, '').downcase.chars.uniq.sort
  end

  def self.alphabet
    [*"a".."z"]
  end
end
