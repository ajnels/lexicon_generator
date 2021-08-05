class WordGenerator

  def initialize (constants, vowels, onset, nucleus, coda)
    @constants = constants
    @vowels = vowels
    @onset = onset
    @nucleus = nucleus
    @coda = coda
  end

  def generate_words
    words = []
    10.times do
      word = ""
      number_syllables = rand(3) + 1
      number_syllables.times do
        selected_onset = @onset[rand(@onset.length)]
        selected_coda = @coda[rand(@coda.length)]
        selected_nucleus = @nucleus[rand(@nucleus.length)]

        word += selected_onset + selected_nucleus
        word += selected_coda if rand <= 0.5

      end
      words << word
    end
    return words
  end

  #Remove constant clusters that aren't allowed. Can use regex and special key-letters for extended behavior
  # For instance, can use a symbol like '(c)' to denote all constants. So something like '(c)z' means all constant clusters ending in -z should be removed
  def remove_forbidden_constant_clusters(word)
    forbidden_clusters = ['(c)rh']
    forbidden_clusters.each do |cluster|
      if cluster.include?('(c)')
        cluster.slice! '(c)'
        regex = @constants.join(cluster + '|')
        #remove trailing '|'
        regex.slice!(regex.length)
        word.gsub!(/#{regex}/, cluster)
      end
    end
    return word
  end

  def show
    print "The Constants: #{@constants.join(', ')} \n"
    print "The Vowels: #{@vowels.join(', ')} \n"
    print "The Onsets: #{@onset.join(', ')} \n"
    print "The Nucleus: #{@nucleus.join(', ')} \n"
    print "The Codas: #{@coda.join(', ')} \n"
  end
end