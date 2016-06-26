class Acronym
  VERSION = 1
  def self.abbreviate(given)
    parse_acronym(given).split.each { |word|
      word[0] = word[0].upcase
      word
    }.join.gsub(/[a-z\W]/, "")
  end

  def self.parse_acronym(given)
    if given.include?(":")
      given = given[0...given.index(":")]
    end
    given.gsub("-", " ")
  end
end
