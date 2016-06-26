class RunLengthEncoding
  VERSION = 1
  def self.encode(data, compression = {}, count = 0)
    data.each_char.with_index do |char, index|
      count += 1
      if char != data[index + 1]
        compression[index.to_s] = count
        count = 0
      end
    end
    encode_format(compression, data)
  end

  def self.decode(comp)
    arr = parse_compression(comp)
    arr.map do |compression|
      if compression.length > 1
        compression[-1] * compression.chop.to_i
      else
        compression
      end
    end.join
  end

  def self.parse_compression(comp, data = [])
    comp.each_char.with_index do |char, index|
      if char.to_i == 0 && comp[index - 1].to_i == 0
        data << char
      elsif char.to_i == 0 && comp[index - 1].to_i != 0
        count = index
        while comp[count - 1].to_i != 0
          count -= 1
        end
        data << comp[count..index]
      end
    end
    data
  end

  def self.encode_format(compression, data)
    compression.map do |index, count|
      if count == 1
        data[index.to_i]
      else
        count.to_s + data[index.to_i]
      end
    end.join
  end
end
