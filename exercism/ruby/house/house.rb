class House
  def self.recite(n=1)
    rhyme = ["This is the house that Jack built.\n\n"]
    while n < pairs.length
      pairs[0..n].reverse.each_with_index { |line, i|
        if i == 0
          rhyme << "This is the #{line[0]}\nthat #{line[1]}"
        elsif i == n
          rhyme << " the #{line[0]} that #{line[1]}\n"
        else
          rhyme << " the #{line[0]}\nthat #{line[1]}"
        end
      }
      rhyme << "\n"
      n += 1
    end
    rhyme.join[0..-2]
  end

  def self.pairs
    [
      ["house", "Jack built."],
      ["malt", "lay in"],
      ["rat", "ate"],
      ["cat", "killed"],
      ["dog", "worried"],
      ["cow with the crumpled horn", "tossed"],
      ["maiden all forlorn", "milked"],
      ["man all tattered and torn", "kissed"],
      ["priest all shaven and shorn", "married"],
      ["rooster that crowed in the morn", "woke"],
      ["farmer sowing his corn", "kept"],
      ["horse and the hound and the horn", "belonged to"]
    ]
  end
end
