var School = function() {
  ROSTER = {};

  this.roster = function() {
    return ROSTER;
  };

  this.add = function(student, grade) {
    if (ROSTER[grade]) {
      ROSTER[grade].push(student);
      ROSTER[grade].sort();
    } else {
      ROSTER[grade] = [student];
    }
  };

  this.grade = function(grade) {
    if (ROSTER[grade]) {
      return ROSTER[grade];
    } else {
      return [];
    }
  };
};

module.exports = School;
