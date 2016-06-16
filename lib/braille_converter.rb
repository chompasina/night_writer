require './lib/file_reader'
require './lib/alphabet'
require 'pry'

class BrailleConverter
  attr_reader :reader, :dictionary
  attr_accessor :line_1, :line_2, :line_3, :message_filename

  def initialize(message_filename, written_filename = 'braille.txt')
    @reader = FileReader.message_filename(message_filename) if message_filename != nil
    @alphabet = Alphabet.new
    # @writer = FileReader.written_filename(message_filename, message)
    @line_1 = []
    @line_2 = []
    @line_3 = []
    @output = []
  end

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

    def triple_lines
      multiple_lines = []
      3.times { multiple_lines << @reader }
      FileReader.written_filename('./lib/triple_lines.txt', multiple_lines.join("\n"))
    end

end
#
# puts ARGV.inspect

# def count_message(message)
#   # binding.pry
#   FileReader.written_filename(message_filename, message)
#   "#{message.length}"
# end
# #
