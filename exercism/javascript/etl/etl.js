var ETL = function() {
  this.transform = function(old) {
    var newScoreMap = {};
    for (var score in old) {
      var letters = Object.values(old[score]);
      for (var i = 0; i < letters.length; i++) {
        newScoreMap[letters[i].toLowerCase()] = parseInt(score);
      }
    }

    return newScoreMap;
  };
};

module.exports = ETL;
