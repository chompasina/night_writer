require './lib/file_reader'
require './lib/alphabet'
require 'pry'

class PlainConverter
attr_accessor :line_1, :line_2, :line_3, :file_name

  def initialize(read_file = './lib/message.txt', write_file = './lib/plain.txt')
    @reader = FileReader.read_file(read_file) if file_name != nil
    @alphabet = Alphabet.new
    # @writer = FileReader.write_file(file_name, message)
    @line_1 = []
    @line_2 = []
    @line_3 = []
    @output = []
  end

  def encode_braille_to_plain(input)
    @output = ""
    input.map do |letter|
      @alphabet.dictionary.invert[letter]

    end
  end
end
