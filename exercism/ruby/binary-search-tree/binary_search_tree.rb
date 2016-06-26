class Bst
  attr_reader :data
  attr_accessor :left, :right
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  def insert(node)
    if node <= data
      left ? left.insert(node) : self.left = Bst.new(node)
    else
      right ? right.insert(node) : self.right = Bst.new(node)
    end
  end

  def each(&block)
    left && left.each(&block)
    block.call(data)
    right && right.each(&block)
  end
end
