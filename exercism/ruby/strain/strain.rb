class Array
  def keep
    return self if empty?
    self.map { |e| e if yield(e) }.compact
  end

  def discard
    return self if empty?
    self.map { |e| e if !yield(e) }.compact
  end
end
