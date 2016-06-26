var CustomSet = function(arr) {

  this.set = createSet(arr);

  this.delete = function(input) {
    var deletion = this.set.indexOf(input);
    if(deletion >= 0) {
      this.set.splice(deletion, 1);
    }
    return this;
  }.bind(this);

  this.eql = function(input) {
    if (this.set.length !== input.set.length) return false;
    for (var i = 0; i < input.set.length; i++){
      if(!includes(this.set, input.set[i])) {
        return false;
      }
    }
    return true;
  }.bind(this);

  this.difference = function(input) {
    difference = [];
    for(var i = 0; i < this.set.length; i++) {
      if(input.set.indexOf(this.set[i]) < 0) {
        difference.push(this.set[i]);
      }
    }
    return new CustomSet(difference);
  }.bind(this);

  this.disjoint = function(input) {
    if(!input.set.length && !this.set.length) {
      return true;
    }

    for(var i = 0; i < input.set.length; i++) {
      if(this.set.indexOf(input.set[i]) > 0) {
        return false;
      }
    }
    return true;
  }.bind(this);

  this.intersection = function(input) {
    var intersection = [];
    for(var i = 0; i < input.set.length; i++) {
      if(this.set.indexOf(input.set[i]) >= 0) {
        intersection.push(input.set[i]);
      }
    }
    return new CustomSet(intersection);
  }.bind(this);

  this.empty = function() {
    this.set = [];
    return this;
  }.bind(this);

  this.member = function(input) {
    return this.set.indexOf(input) >= 0 ? true : false;
  };

  this.put = function(input) {
    if (!this.member(input)) {
      this.set.push(input);
    }

    return this;
  };

  this.size = function() {
    return this.set.length;
  };

  this.subset = function(input) {
    return this.intersection(input).eql(input);
  };

  this.toList = function() {
    return this.set;
  }.bind(this);

  this.union = function(input) {
    union = this.set.concat(input.set);
    return new CustomSet(union);
  };

  function createSet(arr) {
    var set = [];
    if (arr) {
      for(var i = 0; i < arr.length; i++) {
        if(set.indexOf(arr[i]) === -1) {
          set.push(arr[i]);
        }
      }
    }

    return set;
  }

  function includes(a, val){
    return a.indexOf(val) >= 0;
  }
};

module.exports = CustomSet;
