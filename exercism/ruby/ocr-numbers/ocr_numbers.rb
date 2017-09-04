require 'pry'
class OCR
  attr_reader :number_text

  def initialize(number_text)
    binding.pry
    @number_text = number_text.strip.split("\n").map {|n|n.split(" ")}.transpose
  end

  def split_digits(number_text)
    number_text.split("\n\n").map do |digit|
      digit.split("\n").map { |d| d.gsub(" ", "") }
    end
  end

  def convert
    number_text.map do |digit|
      ocr_key_2[digit]
    end.join
  end

  private

    def ocr_key
      {
        [' _ ', '| |', '|_|'] => '0',
        ['   ', '  |', '  |'] => '1',
        [' _ ', ' _|', '|_ '] => '2',
        [' _ ', ' _|', ' _|'] => '3',
        ['   ', '|_|', '  |'] => '4',
        [' _ ', '|_ ', ' _|'] => '5',
        [' _ ', '|_ ', '|_|'] => '6',
        [' _ ', '  |', '  |'] => '7',
        [' _ ', '|_|', '|_|'] => '8',
        [' _ ', '|_|', ' _|'] => '9'
      }
    end

    def ocr_key_2
      {
        ["_", "||", "|_|"]=>"0",
        ["", "|", "|"]=>"1",
        ["_", "_|", "|_"]=>"2",
        ["_", "_|", "_|"]=>"3",
        ["", "|_|", "|"]=>"4",
        ["_", "|_", "_|"]=>"5",
        ["_", "|_", "|_|"]=>"6",
        ["_", "|", "|"]=>"7",
        ["_", "|_|", "|_|"]=>"8",
        ["_", "|_|", "_|"]=>"9"
      }
    end
end
