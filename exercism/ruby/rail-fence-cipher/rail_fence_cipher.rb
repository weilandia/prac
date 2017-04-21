require 'pry'
class RailFenceCipher
  VERSION = 1

  class << self
    #mapping = [[rail, char_idx, char], ...]
    def encode(text, rails)
      pattern_fence = fence_map(rails, text.length)
      mapping = pattern_fence.zip(text.chars).map(&:flatten)
      sorted_by_rail = mapping.sort

      get_chars(sorted_by_rail)
    end

    def decode(text, rails)
      sorted_fence = fence_map(rails, text.length).sort
      mapping = sorted_fence.zip(text.chars).map(&:flatten)
      sorted_by_idx = mapping.sort_by { |map| map[1] }

      get_chars(sorted_by_idx)
    end

    private

      def get_chars(sorted_mappings)
        sorted_mappings.map { |mapping| mapping[2] }.join
      end

      def fence_map(rails, length)
        rail_pattern = 0.upto(rails - 1).to_a + (rails - 2).downto(1).to_a
        text_indices = 0.upto(length).to_a

        rail_pattern.cycle.first(length).zip(text_indices)
      end
  end
end
