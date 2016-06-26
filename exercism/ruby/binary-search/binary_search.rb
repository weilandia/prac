class BinarySearch
  attr_accessor :list
  def initialize(list)
    if sorted?(list)
      @list = list
    else
      raise(ArgumentError, "Your list need to be sortedddddddd")
    end
  end

  def search_for(n, sublist = @list)
    if sublist.empty?
      raise(RuntimeError, "#{n} not found.")
    elsif n == sublist[middle(sublist)]
      list.index(n)
    elsif n < sublist[middle(sublist)]
      sublist = sublist[0..(middle(sublist) - 1)]
      search_for(n, sublist)
    else
      sublist = sublist[(middle(sublist) + 1)..-1]
      search_for(n, sublist)
    end
  end

  def middle(list = @list)
    (list.length - 1) / 2
  end

  def sorted?(list)
    list == list.sort
  end
end
