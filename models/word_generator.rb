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
      number_syllables = rand(2) + 1
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

  def show
    print "The Constants: #{@constants.join(', ')} \n"
    print "The Vowels: #{@vowels.join(', ')} \n"
    print "The Onsets: #{@onset.join(', ')} \n"
    print "The Nucleus: #{@nucleus.join(', ')} \n"
    print "The Codas: #{@coda.join(', ')} \n"
  end
end