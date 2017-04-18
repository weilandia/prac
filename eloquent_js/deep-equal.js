var DeepEqual = function() {
  this.evaluate = function() {
    var result = [];
    for (var i = 0; i < arguments.length; i++) {
      if (arguments[i + 1]) {
        if (typeof(arguments[i]) == "object" && arguments[i] !== null) {
          for(var prop in arguments[i]) {
            if (typeof(arguments[i][prop]) == "object") {
               result.push(this.evaluate(arguments[i][prop], arguments[i + 1][prop]));
            } else {
              if (arguments[i][prop] !== arguments[i + 1][prop]) {
                result.push(false);
              }
            }
          }
        }
      }
    }
    return result.indexOf(false) < 0;
  };
};

module.exports = DeepEqual;
