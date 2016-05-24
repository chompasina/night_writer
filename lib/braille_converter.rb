# require 'file_reader'

class BrailleConverter
  attr_reader :FileReader

  def initialize
    @reader = FileReader.new
  end


  def read_file(message.txt)
      #in command line type $ ruby ./lib/file_reader.rb message.txt braille.txt
      handle = File.open(ARGV[0], "r")
      incoming_text = handle.read
      handle.close
      #now contents of file have been read
      braille_converted_text = incoming_text * 3
      writer = File.open(ARGV[1], "w")
      writer.write(braille_converted_text)
      writer.close
      #put in shell:
      #ruby file_reader.rb message.txt braille.txt

      puts "Created #{ARGV[1]} containing #{incoming_text.length} characters"
    end
  end
    #open the filename
    #access the information, store it in a string
    #how many characters are in a string?
    # file = File.open(message.txt)

    #puts file.inspect ??
    #puts file.read ??
    # file.close ??
    #
  end

  def encode_file_to_braille
    #takes file and converts to braille
    plain = reader.read
    braille = encode_to_braille(plain)
  end

  def encode_to_braille(input)
    #takes input string, converts, sends out an output string
  end
end

puts ARGV.inspect
