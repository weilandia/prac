class FoodChain
  VERSION = 2
  def self.verse(n)
    verse = first_line(meal(n))
    return verse + last_line if n == 1
    return verse + "She's dead, of course!" if n == 8

    verse += effect(n-2)
    verse += build_verses(n)
    verse += last_line
    verse
  end

  def self.verses(start, stop)
    result = ""
    (start..stop).to_a.each do |i|
      result += verse(i) + "\n"
    end
    result
  end

  def self.song
    verses(1,8)
  end

  private

  def self.meal(n)
    prey[n-1]
  end

  def self.build_verses(n)
    chain = []
    i = 0
    while i < n - 1
      chain << motivation(i)
      i += 1
    end
    chain.reverse.join
  end

  def self.first_line(meal)
    "I know an old lady who swallowed a #{meal}.\n"
  end

  def self.effect(n)
    "#{effects[n]}\n"
  end

  def self.motivation(i)
    motivation = "She swallowed the #{prey[i+1]} to catch the #{prey[i]}"
    motivation +=  " that wriggled and jiggled and tickled inside her" if i == 1
    motivation + ".\n"
  end


  def self.prey
    ["fly",
     "spider",
     "bird",
     "cat",
     "dog",
     "goat",
     "cow",
     "horse"]
  end

  def self.effects
    ["It wriggled and jiggled and tickled inside her.",
     "How absurd to swallow a bird!",
     "Imagine that, to swallow a cat!",
     "What a hog, to swallow a dog!",
     "Just opened her throat and swallowed a goat!",
     "I don't know how she swallowed a cow!"]
  end

  def self.last_line
    "I don't know why she swallowed the fly. Perhaps she'll die.\n"
  end
end
