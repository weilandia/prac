class Anagram
  attr_reader :word
  def initialize(word)
    @word = word
  end

  def match(possible_anagrams)
    preprocess(possible_anagrams).map do |anagram|
      scrubbed(anagram) == scrubbed(word) ? anagram : nil
    end.compact
  end

  def scrubbed(string)
    string.chars.map(&:downcase).sort
  end

  def preprocess(possible_anagrams)
    possible_anagrams.map do |anagram|
      anagram.downcase != word ? anagram : nil
    end.compact
  end
end
