var Isogram = function(input) {
  this.input = input;

  this.parseAndSplitInput = (string) => {
    return string.replace(/[\*\^\'\!\_\-\s]/g, '').toLowerCase().split('');
  };

  this.unique = function(value, index, self) {
    return self.indexOf(value) === index;
  };

  this.isIsogram = () => {
    var input = this.parseAndSplitInput(this.input);
    var filter = input.filter(this.unique);
    return filter.length === input.length;
  };
};

module.exports = Isogram;
