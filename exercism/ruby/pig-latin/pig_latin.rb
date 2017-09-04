class PigLatin
  def self.translate(text)
    text.split(" ").map do |word|
      PigLatinWord.for(word)
    end.join(" ")
  end
end

class PigLatinWord
  class << self
    def for(word)
      if word =~ PigLatinSimpleWord::MATCHER
        PigLatinSimpleWord.new(word).to_s
      elsif word =~ PigLatinQUWord::MATCHER
        PigLatinQUWord.new(word).to_s
      elsif word =~ PigLatinNormalSubstitutionWord::MATCHER
        PigLatinNormalSubstitutionWord.new(word).to_s
      end
    end
  end

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def to_s
    "#{translate}ay"
  end

  def translate
    word.split(self.class::MATCHER).reverse.join
  end
end

class PigLatinSimpleWord < PigLatinWord
  MATCHER = /^[aeiou]|^(yt.*)|^(xr.*)/
  def translate
    word
  end
end

class PigLatinNormalSubstitutionWord < PigLatinWord
  MATCHER = /([aeiou].*)/
end

class PigLatinQUWord < PigLatinNormalSubstitutionWord
  MATCHER = /(.qu)|(qu)/
end


class BookKeeping
  VERSION = 1
end
