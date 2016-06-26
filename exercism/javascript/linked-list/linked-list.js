var LinkedList = function() {
  this.head = null;

  this.push = function(node) {
    newNode = new Node(node, null);
    if(this.head) { var node = this.nodeStep(this.head, newNode) : this.head = node
  }

  this.pop = function() {

  }

  this.nodeStep = function(currentNode, node, action) {
    if(currentNode.nextNode) {
      this.nodeStep(currentNode.nextNode, node)
    } else {
      if(action = "push") {
        currentNode.next = node;
        return node;
      } else if(action = "pop") {

      }

    }
  }
}

var Node = function(data, nextNode) {
  this.data = data;
  this.next = nextNode;
}

module.exports = LinkedList, Node
