var Pangram = function(string) {
  var arrayUnique = function(arr) {
    return arr.reduce(function(set, char) {
      if (set.indexOf(char) < 0) set.push(char);
      return set;
    }, []);
  };

  this.isPangram = function() {
    var chars = string.toLowerCase().replace(/[^a-z]/gi, '').split("");

    var uniqueChars = arrayUnique(chars);

    return uniqueChars.length === 26
  };
}

module.exports = Pangram;
