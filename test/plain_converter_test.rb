require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_reader'
require './lib/plain_converter'
require './lib/alphabet.rb'

class PlainConverterTest < Minitest::Test


  def test_it_can_convert_a_single_braille_letter_to_plain
    pc = PlainConverter.new(nil)
    result = pc.encode_braille_to_plain([["0.","..",".."]])
    assert_equal ["a"], result
  end

  def test_it_can_convert_two_letters_to_plain
    pc = PlainConverter.new(nil)
    result = pc.encode_braille_to_plain([["0.","..",".."],["0.","0.",".."]])
    assert_equal ["a","b"], result
  end

  def test_it_can_print_to_file
    pc = PlainConverter.new(read_file, write_file)
    result = pc.encode_braille_to_plain([["0.","..",".."],["0.","0.",".."]])
    assert_equal ["a","b"], result
  end

end
