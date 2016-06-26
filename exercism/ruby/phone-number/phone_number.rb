class PhoneNumber
  attr_reader :number
  def initialize(number)
    @number = processed_number(number)
  end

  def area_code
    number[0..2]
  end

  def processed_number(number)
    return "0000000000" if number =~ /[a-zA-Z]/
    number.gsub!(/[^\d]/,"")
    analyze_number(number)
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end

  def analyze_number(number)
    if number.length > 11 || number.length < 10 || number.length > 10 && number[0] != "1"
      "0000000000"
    elsif number.length == 11
      number[1..-1]
    else
      number
    end
  end
end
