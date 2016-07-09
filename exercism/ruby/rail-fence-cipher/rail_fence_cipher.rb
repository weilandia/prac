class RailFenceCipher
  def self.encode(message, rows, encoding = [])
    return encoding.join + message if rows == 1
    get_rows(message, rows, encoding)
  end

  def self.get_rows(message, rows, encoding)
    chars = message.chars
    indices = select_row_indices(message.length, encoding, rows)

    indices.each { |i|
      encoding << chars[i]
      chars[i] = nil
    }

    message = chars.compact.join
    encode(message, rows - 1, encoding)
  end

  def self.distance_between_numbers_in_row(rows)
    return 0 if rows <= 1
    (rows - 1) * 2 - 1
  end

  def self.select_row_indices(length, encoding, rows)
    return select_top_row_indices(length, rows) if encoding.empty?
    indices = [*0..length].select { |n| in_row?(n, rows) }
    indices.dup.each_with_index { |element, i|
      unless element == 0
        indices.insert(i, element - 1)
      end
    }

    indices.sort
  end

  def self.in_row?(index, rows)
    factor = rows * 2 - 1
    index % factor == 0 || index == 0
  end

  def self.select_top_row_indices(length, rows)
    distance = distance_between_numbers_in_row(rows)
    [*0..length].select { |n| n % (distance + 1) == 0 }
  end
end
