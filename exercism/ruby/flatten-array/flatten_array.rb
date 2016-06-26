class FlattenArray
  VERSION = 1
  def self.flatten(arr, flat_arr = [])
    arr.each { |e|
      e.kind_of?(Array) ? self.flatten(e, flat_arr) : flat_arr << e if e
    }
    flat_arr
  end
end
