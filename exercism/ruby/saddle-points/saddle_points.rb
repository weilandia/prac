class Matrix
  attr_reader :rows
  def initialize(matrix)
    @rows = build(matrix)
    @columns = columns
  end

  def build(matrix)
    matrix.split("\n").map { |row| row.split(" ").map(&:to_i) }
  end

  def columns
    column_arr = zip_columns(@rows, @rows.length - 1)
    column_arr.map { |column|
      column.flatten.reverse
    }
  end

  def saddle_points
    @rows.each_with_index.inject([]) do |points, (row, row_index)|
      row.each_with_index do |digit, column_index|
        if row.max == digit && row.max == @columns[column_index].min
          points << [row_index, column_index]
        end
      end
      points
    end
  end

  private
    def zip_columns(rows, i)
      columns = rows[i]
      i.times do
        columns = columns.zip(rows[(i - 1)])
        i -= 1
      end
      columns
    end
end
