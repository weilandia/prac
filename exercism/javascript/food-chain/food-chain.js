var FoodChain = function() {
  var lastVerse = 8;
  this.verses = function(n, stop) {
    var song = [];

    while (n <= stop) {
      song.push(this.verse(n));
      n++;
    }

    return this.formatVerses(song);
  };

  this.verse = function(n) {
    var verse = [];
    var currentVerse = n;
    verse.push(this.firstLine(this.nouns[n]));
    while (currentVerse > 0 && currentVerse < lastVerse) {
      this.populateVerses(n, currentVerse, verse);
      currentVerse--;
    }

    if (currentVerse === lastVerse) {
      verse.push(this.refrain[currentVerse]);
    }

    return this.formatVerses(verse);
  };

  this.formatVerses = function(verses) {
    return verses.join("\n") + "\n";
  };

  this.populateVerses = function(n, currentVerse, verse) {
    if (currentVerse === n || currentVerse === 1) {
      verse.push(this.refrain[currentVerse]);
    }

    if (currentVerse > 1) {
      verse.push(this.joiner(currentVerse));
    }
  };

  this.firstLine = function(noun) {
    return "I know an old lady who swallowed a " + noun + ".";
  };

  this.nouns = {
    '1': 'fly',
    '2': 'spider',
    '3': 'bird',
    '4': 'cat',
    '5': 'dog',
    '6': 'goat',
    '7': 'cow',
    '8': 'horse'
  };

  this.refrain = {
    '1': "I don't know why she swallowed the fly. Perhaps she'll die.",
    '2': "It wriggled and jiggled and tickled inside her.",
    '3': "How absurd to swallow a bird!",
    '4': "Imagine that, to swallow a cat!",
    '5': "What a hog, to swallow a dog!",
    '6': "Just opened her throat and swallowed a goat!",
    '7': "I don't know how she swallowed a cow!",
    '8': "She's dead, of course!"
  };

  this.joiner = function(n) {
    if (n === 3) {
      return "She swallowed the " + this.nouns[n] + " to catch the " + this.nouns[n - 1] + " that wriggled and jiggled and tickled inside her.";
    } else {
      return "She swallowed the " + this.nouns[n] + " to catch the " + this.nouns[n - 1] + ".";
    }
  };
};

module.exports = FoodChain;
