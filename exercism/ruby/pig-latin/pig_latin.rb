class PigLatin
  def self.translate(text)
    text.split.map do |word|
      PigLatinWord.for(word).to_s
    end.join(" ")
  end
end

class PigLatinWord
  class << self
    def for(word)
      if word =~ PigLatinSimpleWord::MATCHER
        PigLatinSimpleWord.new(word)
      elsif word =~ PigLatinQUWord::MATCHER
        PigLatinQUWord.new(word)
      elsif word =~ PigLatinNormalSubstitutionWord::MATCHER
        PigLatinNormalSubstitutionWord.new(word)
      end
    end
  end

  attr_reader :word

  def initialize(word)
    @word = word
  end

  def to_s
    "#{translation}ay"
  end

  def translation
    word.split(self.class::MATCHER).reverse.join
  end
end

class PigLatinSimpleWord < PigLatinWord
  MATCHER = /^[aeiou]|^(yt.*)|^(xr.*)/i
  def translation
    word
  end
end

class PigLatinNormalSubstitutionWord < PigLatinWord
  MATCHER = /([aeiou].*)/i
end

class PigLatinQUWord < PigLatinWord
  MATCHER = /(.qu)|(qu)/i
end


class BookKeeping
  VERSION = 1
end
