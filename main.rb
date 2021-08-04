require_relative 'models/phonology_reader'
require_relative 'models/word_generator'

include PhonologyReader

def open_prompt
  puts "\nWelcome to Lexicon Generator"
  puts 'Show (p)honology'
  puts 'Define a (s)yllable structure'
  puts '(G)enerate words'
  puts '(Q)uit'

  gets.chomp.downcase.strip
end

#the opening of the program
word_generator = Object
while true
  user_input = open_prompt

  case user_input
    when 'p'
      constants, vowels, onset, nucleus, coda = PhonologyReader::read_file
      word_generator = WordGenerator.new(constants, vowels, onset, nucleus, coda)
      word_generator.show
    when 's'
      puts 'Syllable structure'
    when 'g'
      puts "\nGenerating words:"
      words = word_generator.generate_words
      print words.join(', ') + "\n"
    when 'q'
      exit
    else
      'Not a defined input'
  end
end