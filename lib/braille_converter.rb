require './lib/file_reader'
require './lib/alphabet'
require 'pry'

class BrailleConverter
  attr_reader :reader, :dictionary
  attr_accessor :line_1, :line_2, :line_3, :file_name

  def initialize(read_file, write_file = 'braille.txt')
    @reader = FileReader.read_file(read_file) if file_name != nil
    @alphabet = Alphabet.new
    # @writer = FileReader.write_file(file_name, message)
    @line_1 = []
    @line_2 = []
    @line_3 = []
    @output = []
  end

  # def encode_file_to_braille
  #   plain = reader.read
  #   braille = encode_to_braille(plain)
  # end

  def encode_to_braille(input)
    @output = []
    input.chomp.split(//).map do |letter|
      @output << @alphabet.dictionary[letter]
    end
  end

  def top_line
    @output.each do |letter|
      @line_1 << letter[0]
    end
    @line_1.push("\n")
  end

  def middle_line
    @output.each do |letter|
      @line_2 << letter[1]
    end
    @line_2.push("\n")
  end

  def bottom_line
    @output.each do |letter|
      @line_3 << letter[2]
    end
    @line_3.push("\n")
  end

  def total_lines
    a = @line_1.join
    b= @line_2.join
    c= @line_3.join
    braille_message = a + b + c
  end

    # def triple_lines
    #   multiple_lines = []
    #   3.times { multiple_lines << @reader }
    #   FileReader.write_file('./lib/triple_lines.txt', multiple_lines.join("\n"))
    # end



    #start with lowercase letters and characters
    #capital letters - need to tell it to look at the character before it


end
#
# puts ARGV.inspect

# def count_message(message)
#   # binding.pry
#   FileReader.write_file(file_name, message)
#   "#{message.length}"
# end
# #



  #puts file.inspect ??
  #puts file.read ??
  # file.close ??
