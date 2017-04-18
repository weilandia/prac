var should = require('should');
describe('deepEqual', function() {
  var DeepEqual = require("../deep-equal.js");
  var deepEqual = new DeepEqual();

  it('should assert two objects are identical', function() {
    var obj1 = {
      a: 1,
      b: {
        c: 2,
        d: {
          e: 3
        }
      }
    };

    var obj2 = {
      a: 1,
      b: {
        c: 2,
        d: {
          e: 3
        }
      }
    };

    deepEqual.evaluate(obj1, obj2).should.equal(true);
  });

  it('should assert two objects are not identical', function() {
    var obj1 = {
      a: 1,
      b: {
        c: 2,
        d: {
          e: 3
        }
      }
    };

    var obj2 = {
      a: 1,
      b: {
        c: 1,
        d: {
          e: 2
        }
      }
    };

    deepEqual.evaluate(obj1, obj2).should.equal(false);
  });

  it('should assert any number of objects are identical', function() {
    var obj1;
    var obj2;
    var obj3;
    var obj4;
    var obj5;

    var objs = [obj1, obj2, obj3, obj4, obj5];

    for (var i = 0; i < objs.length; i++) {
      objs[i] = {
        a: 1,
        b: {
          c: 2,
          d: {
            e: 1
          }
        }
      };
    }

    deepEqual.evaluate(obj1, obj2, obj3, obj4, obj5).should.equal(true);
  });

  it('should refute any number of objects are identical', function() {
    var obj1;
    var obj2;
    var obj3;
    var obj4;
    var obj5;

    var objs = [obj1, obj2, obj3, obj4, obj5];

    for (var i = 0; i < objs.length; i++) {
      objs[i] = {
        a: 1,
        b: {
          c: 2,
          d: {
            e: 1
          }
        }
      };
    }

    var obj6 = {a: 2};

    deepEqual.evaluate(obj1, obj2, obj3, obj4, obj5, obj6).should.equal(true);
  });
});
