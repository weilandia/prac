require 'pry'
class RailFenceCipher
  def self.encode(msg, rails)
    RailFenceCipher.new(decoded_msg: msg, rails: rails).encode
  end

  def self.decode(msg, rails)
    RailFenceCipher.new(encoded_msg: msg, rails: rails).decode
  end

  attr_reader :message, :encoding, :rails

  def initialize(decoded_msg: nil, encoded_msg: nil, rails:)
    @rails = rails
    @message = decoded_msg || []
    @encoding = encoded_msg || empty_fence
  end

  def encode
    current_rail = 0
    incr = -1
    message.each_char { |char|
      encoding[current_rail] << char
      incr = incr * -1 if reverse_incr(current_rail)
      current_rail += incr
    }

    encoding.flatten.join
  end

  def decode
    return encoding if message_not_encoded

    slice_size = rails + (rails - 2)
    encoding.split("").each_slice(slice_size) { |slice|
      message << slice.each_slice(rails).to_a
    }

    binding.pry
  end


  private

    def message_not_encoded
      encoding.length < rails || rails == 1
    end

    def reverse_incr(current_rail)
      current_rail == max_rails_idx || current_rail == 0
    end

    def max_rails_idx
      rails - 1
    end

    def empty_fence
      rails.times.inject([]) { |fence| fence << [] }
    end
end
