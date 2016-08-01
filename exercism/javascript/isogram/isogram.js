var Isogram = function(word) {
  this.isIsogram = () => {
    var arr = word.replace(/\W/g, '').toLowerCase().split("");

    var unique = function(value, index, self) {
      return self.indexOf(value) === index;
    };

    var filter = arr.filter(unique);

    return filter.length === arr.length;
  };
};

module.exports = Isogram;
