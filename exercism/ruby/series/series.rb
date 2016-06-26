class Series
  attr_reader :input, :series
  def initialize(string)
    @input = string.chars.map(&:to_i)
    @series = []
  end

  def slices(slices)
    check_slices(slices)
    build_series(slices)
    series
  end

private
  def check_slices(slices)
    if slices > @input.length
      raise ArgumentError.new("lolololololololol")
    end
  end

  def build_series(slices)
    input.each_with_index do |_n, index|
      series << input[index..(index + (slices-1))].to_a
    end
    clean_series(slices)
  end

  def clean_series(slices)
    (slices - 1).times do
      if series.last.length != slices
        series.pop
      end
    end
  end
end
