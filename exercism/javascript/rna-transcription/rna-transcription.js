var DnaTranscriber = function() {
  this.toRna = function(dna) {
    var rna = dna.split("").map(function(nucleotide) {
      if (nucleotide === "G") {
        return "C";
      } else if (nucleotide === "C") {
        return "G";
      } else if (nucleotide === "T") {
        return "A";
      } else if (nucleotide === "A") {
        return "U";
      } else {
        throw "Error"
      };
    });
    return rna.join("");
  };
}
module.exports = DnaTranscriber;
