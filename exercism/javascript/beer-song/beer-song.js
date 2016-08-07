var BeerSong = function() {
  this.verse = function(verse) {
    if (verse === 0) {
      return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n";
    } else if (verse === 1) {
      return "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n";
    } else if (verse === 2) {
      return verse + " bottles of beer on the wall, " + verse + " bottles of beer.\nTake one down and pass it around, " + (verse - 1) + " bottle of beer on the wall.\n";
    } else {
      return verse + " bottles of beer on the wall, " + verse + " bottles of beer.\nTake one down and pass it around, " + (verse - 1) + " bottles of beer on the wall.\n";
    }
  };

  this.sing = function(current_verse, ending_verse) {
    var song = "";
    if (ending_verse === undefined) {ending_verse = 0;}

    while (current_verse >= ending_verse) {
      song += this.verse(current_verse);

      if (current_verse != ending_verse) {song += "\n";}

      current_verse--;
    }

    return song;
  };
};

module.exports = BeerSong;
