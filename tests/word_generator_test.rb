require 'test/unit'
require_relative '../models/word_generator'

class WordGeneratorTest < Test::Unit::TestCase

  def test_remove_forbidden_constant_clusters
    word = 'crharhbrh'
    word_gen = WordGenerator.new(['c', 'b', 'rh'], ['a'], [], [], [])
    cleaned_word = word_gen.remove_forbidden_constant_clusters(word)

    assert_equal('rharhrh', cleaned_word)
  end
end