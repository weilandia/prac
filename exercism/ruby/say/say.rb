class Say
  def initialize(number)
    check_number(number)
    @number = prep_number(number.to_s)
  end

  def check_number(number)
    if number < 0 || number > 999_999_999_999
      raise ArgumentError
    end
  end

  def prep_number(number)
    until number.length % 3 == 0
      number.prepend("0")
    end
    number.scan(/.{3}/)
  end

  def in_english
    return "zero" if @number.first == "000"
    words = numbers_to_words
    words_with_place_values = assign_place(words)
    clean(words_with_place_values)
  end

  def numbers_to_words
    @number.map { |n|
      translate_words(n)
    }
  end

  def assign_place(words)
    words.reverse.map.with_index { |word, i|
      if word.length > 0
        word + powers_arr[i]
      end
    }.reverse
  end

  def clean(arr)
    arr.compact.map { |string| string.gsub("-zero", "") }.join(" ").strip
  end

  def translate_words(n)
    n = translate_tens(n)
    n = translate_hundreds(n)
  end

  def translate_tens(n)
    if n[1] == "1" || n[1] == "0"
      n[1..2] = upto_twenty[n[1..2]]
    else
      n[2] = ones[n[2]]
      n[1] = tens[n[1]]
    end
    n
  end

  def translate_hundreds(n)
    if n[0] != "0"
      n[0] = ones[n[0]] + " hundred"
    else
      n[0] = ""
    end
    n
  end

  def ones
    {
      "0" => "zero",
      "1" => "one",
      "2" => "two",
      "3" => "three",
      "4" => "four",
      "5" => "five",
      "6" => "six",
      "7" => "seven",
      "8" => "eight",
      "9" => "nine"
    }
  end

  def upto_twenty
    {
      "00" => "",
      "01" => "one",
      "02" => "two",
      "03" => "three",
      "04" => "four",
      "05" => "five",
      "06" => "six",
      "07" => "seven",
      "08" => "eight",
      "09" => "nine",
      "10" => " ten",
      "11" => " eleven",
      "12" => " twelve",
      "13" => " thirteen",
      "14" => " fourteen",
      "15" => " fifteen",
      "16" => " sixteen",
      "17" => " seventeen",
      "18" => " eighteen",
      "19" => " nineteen"
    }
  end

  def tens
    {
      "1" => "ten",
      "2" => " twenty-",
      "3" => " thirty-",
      "4" => " forty-",
      "5" => " fifty-",
      "6" => " sixty-",
      "7" => " seventy-",
      "8" => " eighty-",
      "9" => " ninety-"
    }
  end

  def powers_arr
    ["", " thousand", " million", " billion"]
  end
end
