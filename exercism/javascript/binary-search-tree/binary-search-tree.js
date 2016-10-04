var Bst = function(node) {
  this.data = node;
  this.right = null;
  this.left = null;

  this.insert = function(newNode, currentNode) {
    currentNode = currentNode || this;

    if (newNode <= currentNode.data) {
      if (currentNode.left === null) {
        currentNode.left = new Bst(newNode);
      } else {
        this.insert(newNode, currentNode.left);
      }
    } else {
      if (currentNode.right === null) {
        currentNode.right = new Bst(newNode);
      } else {
        this.insert(newNode, currentNode.right);
      }
    }
  };

  this.each = function(proc) {
    if (this.left) {
      this.left.each(proc);
    }

    proc(this.data);

    if (this.right) {
      this.right.each(proc);
    }
  };
};

module.exports = Bst;
