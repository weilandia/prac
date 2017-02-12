ROBOTS = [];
var Robot = function() {
  this.name = generateName();

  this.reset = function() {
    this.name = generateName();
  };

  function generateName() {
    var name = buildName(name);
    while (invalid(name)) {
      name = buildName();
    }

    ROBOTS.push(name);
    return name;
  }

  function buildName() {
    var name = [];
    for (var i = 0; i < 5; i++) {
      if (i < 2) {
        name.push(generateRandomLetter());
      } else {
        name.push(generateRandomnumber());
      }
    }

    return name.join("");
  }

  function invalid(name) {
    return ROBOTS.includes(name);
  }

  function generateRandomLetter() {
    return String.fromCharCode(65 + Math.floor(Math.random() * 26));
  }

  function generateRandomnumber() {
    return Math.floor((Math.random() * 10));
  }
};

module.exports = Robot;
