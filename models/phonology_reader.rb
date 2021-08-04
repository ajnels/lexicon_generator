module PhonologyReader
  def read_file
    sounds = Array.new
    file_name = 'data/phonology.txt'
    File.foreach(file_name) do |line|
      sounds << line.split(',').each { |cc| cc.strip! }
    end

    constants = sounds[0]
    vowels    = sounds[1]
    onset     = sounds[2]
    nucleus   = sounds[3]
    coda      = sounds[4]

    return constants, vowels, onset, nucleus, coda
  end
end