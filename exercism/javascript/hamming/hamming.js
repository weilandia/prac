var Hamming = function() {
  this.compute = function(s1, s2) {
    var dist = 0;
    if(s1.length != s2.length)
      throw(new Error('DNA strands must be of equal length.'));
    for(var i = 0; i < s1.length; i++)
      if(s1[i] != s2[i])
        dist++;
    return dist;
  }
}

module.exports = Hamming;
