require 'pry'
class OCR
  attr_reader :number_text, :with_commas

  def initialize(number_text)
    @with_commas = !number_text.scan(/\n\n/).empty?
    @number_text = number_text.split("\n\n")
  end

  def convert
    digits = number_text.map { |section| get_digits(section) }
    binding.pry
    cardinals = translate(digits)
    formatted_cardnals(cardinals)
  end

  private

    def formatted_cardnals(cardinals)
      if with_commas
        comma_formatted(cardinals)
      else
        cardinals
      end
    end

    def comma_formatted(number)
      number.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end

    def translate(digits)
      digits.flatten.map { |digit| ocr_key[digit] }.join
    end

    def get_digits(text)
      text.split("\n").inject([]) do |digits, row|
        digits << row.scan(/.{1,3}/)
      end.transpose.map(&:join)
    end

    def ocr_key
      {
        " _| ||_|"   => "0",
        "     |  |"  => "1",
        " _  _||_ "  => "2",
        " _  _| _|"  => "3",
        "   |_|  |"  => "4",
        " _ |_  _|"  => "5",
        " _ |_ |_|"  => "6",
        " _   |  |"  => "7",
        " _ |_||_|"  => "8",
        " _ |_| _|"  => "9"
      }
    end
end
