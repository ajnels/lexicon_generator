require 'test/unit'
require_relative '../models/word_generator'

class WordGeneratorTest < Test::Unit::TestCase

  def test_remove_forbidden_constant_clusters
    word = 'crharhbrh'
    word_gen = WordGenerator.new(['c', 'b', 'rh'], ['a'], [], [], [])
    cleaned_word = word_gen.remove_forbidden_constant_clusters(word)

    assert_equal('rharhrh', cleaned_word)
  end

  def test_remove_trailing_char
    word = 'asdf\''
    word_gen = WordGenerator.new([], [], [], [], [])
    cleaned_word = word_gen.remove_trailing_char(word)

    assert_equal('asdf', cleaned_word)
  end
end