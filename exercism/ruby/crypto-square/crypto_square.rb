class Crypto
  attr_accessor :message
  def initialize(message)
    @message = message
  end

  def normalize_ciphertext
    ciphertext(true).join(" ")
  end

  def ciphertext(normalize = false)
    square = plaintext_segments.map(&:chars)
    until square.last.length == square.first.length
      square.last << nil
    end
    if normalize
      square.transpose.map(&:join)
    else
      square.transpose.map(&:join).join
    end
  end

  def plaintext_segments
    normalize_plaintext.chars.each_slice(size).to_a.map(&:join)
  end

  def normalize_plaintext
    message.gsub(/[^[:alnum:]]/, '').downcase
  end

  def size
    square = normalize_plaintext.length
    until Math.sqrt(square).to_i**2 == square
      square += 1
    end
    Math.sqrt(square).to_i
  end
end
