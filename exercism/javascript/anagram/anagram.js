var Anagram = function(input) {
  this.matches = function(list) {
    if (list.constructor.name !== "Array") {
      list = Array.prototype.slice.call(arguments);
    }

    var split_input = input.toLowerCase().split("").sort();
    var anagrams = [];
    for (var i = 0; i < list.length; i++) {
      if (list[i].toLowerCase().split("").sort().join("") === split_input.join("") && list[i].toLowerCase() != input.toLowerCase()) {
        anagrams.push(list[i]);
      }
    }

    return anagrams;
  };
};

module.exports = Anagram;
