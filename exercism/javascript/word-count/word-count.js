var Words = function() {
  this.count = function(words) {
    var tally = {};
    words.trim().split(/[\n\r\s]+/).forEach(function(word) {
      word = word.toLowerCase();
      if(tally[word]) {
        tally[word] += 1;
      } else {
        tally[word] = 1;
      }
    })
    return tally;
  }
}

module.exports = Words;
