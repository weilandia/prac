var PhoneNumber = function(input) {
  this.number = function() {
    var number = input.replace(/\D/g,'');

    if (number[0] == '1' && number.length > 10) {
      number = number.substring(1, number.length);
    }

    if (number.length != 10) {
      return '0000000000';
    } else {
      return number;
    }
  };

  this.areaCode = function() {
    number = this.number();

    return number.substring(0, 3);
  };

  this.toString = function() {
    number = this.number();

    return '(' + number.substring(0, 3) + ') ' + number.substring(3, 6) + '-' + number.substring(6, 10);
  };
};

module.exports = PhoneNumber;
