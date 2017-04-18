#!/usr/bin/env ruby
# encoding: utf-8
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'isogram'

# Common test data version: c59c2c4
class IsogramTest < Minitest::Test
  def test_empty_string
    # skip
    string = ''
    assert Isogram.is_isogram?(string)
  end

  def test_isogram_with_only_lower_case_characters
    string = 'isogram'
    assert Isogram.is_isogram?(string)
  end

  def test_word_with_one_duplicated_character
    string = 'eleven'
    refute Isogram.is_isogram?(string)
  end

  def test_longest_reported_english_isogram
    string = 'subdermatoglyphic'
    assert Isogram.is_isogram?(string)
  end

  def test_word_with_duplicated_character_in_mixed_case
    string = 'Alphabet'
    refute Isogram.is_isogram?(string)
  end

  def test_hypothetical_isogrammic_word_with_hyphen
    string = 'thumbscrew-japingly'
    assert Isogram.is_isogram?(string)
  end

  def test_isogram_with_duplicated_non_letter_character
    string = 'Hjelmqvist-Gryb-Zock-Pfund-Wax'
    assert Isogram.is_isogram?(string)
  end

  def test_made_up_name_that_is_an_isogram
    string = 'Emily Jung Schwartzkopf'
    assert Isogram.is_isogram?(string)
  end
  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html
  def test_bookkeeping
    assert_equal 2, BookKeeping::VERSION
  end

  module BookKeeping
    VERSION = 2
  end
end
