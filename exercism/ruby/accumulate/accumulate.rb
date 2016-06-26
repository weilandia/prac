class Array
  def accumulate(result = [], &block)
    each { |e| result << block.call(e) }
    result
  end
end
