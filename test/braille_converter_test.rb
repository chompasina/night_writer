require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_reader'
require './lib/braille_converter'

#steps for file IO
#1 in shell, type ruby file.rb first.txt second.txt

class BrailleConverterTest < Minitest::Test
  # def setup
  # end

  def test_can_read_a_message_and_return_character_count
    skip
    read_file = './lib/plain_message.txt'
    bc = BrailleConverter.new(read_file)
    reader = FileReader.read_file(read_file)
    message = "hi friends"
    count = bc.count_message(message)
    assert_equal "10", count
  end

  def test_can_open_file_and_return_count
    skip
    read_file = './lib/plain_message.txt'
    bc = BrailleConverter.new(read_file)
      reader = FileReader.read_file(read_file)
    count = bc.count_message(message)
    assert_equal 13, count
  end

  def test_if_converter_can_load_file
    read_file = './lib/hi_friends.txt'
    bc = BrailleConverter.new(read_file)
    assert bc.reader
    assert bc.reader.include?("hi friends")
  end

  def test_can_return_three_lines
    read_file = './lib/plain_message.txt'
    bc = BrailleConverter.new(read_file)
    bc.triple_lines
  end

  def test_it_can_convert_a_single_english_letter
    bc = BrailleConverter.new('./lib/plain_message.txt')
    result = bc.encode_to_braille("a")
    assert_equal [["0.","..",".."]], result
  end

  def test_it_can_translate_multiple_english_letters
    bc = BrailleConverter.new(nil)
    result = bc.encode_to_braille("ab")
    assert_equal [["0.","..",".."], ["0.","0.",".."]], result
  end

  def test_it_can_output_spaces_between_words
    bc = BrailleConverter.new(nil)
    result = bc.encode_to_braille("a b")
    assert_equal [["0.","..",".."], ["..", "..", ".."], ["0.","0.",".."]], result
  end

  def test_it_can_output_a_symbol
    bc = BrailleConverter.new(nil)
    result = bc.encode_to_braille("a! b")
    assert_equal [["0.","..",".."], ["..","00","0."], ["..", "..", ".."], ["0.","0.",".."]], result
  end

  def test_it_can_output_braille_to_file
    read_file = './lib/plain_message.txt'
    bc = BrailleConverter.new(read_file)
    result = bc.encode_to_braille("a! b")
    assert_equal [["0.","..",".."], ["..","00","0."], ["..", "..", ".."], ["0.","0.",".."]], result
  end

  def test_it_can_format_one_braille_letter_to_one_of_three_lines
    bc = BrailleConverter.new(nil)
    result = bc.encode_to_braille("a")
    assert_equal ["0."], bc.top_line
  end

  def test_it_can_format_two_braille_letters_to_one_of_three_lines
    bc = BrailleConverter.new(nil)
    bc.encode_to_braille("ab")
    assert_equal "0.0.", bc.top_line
  end

  def test_it_can_format_one_braille_letter_to_two_of_three_lines
    bc = BrailleConverter.new(nil)
    bc.encode_to_braille("a")
    assert_equal "0.", bc.top_line
    assert_equal "..", bc.middle_line
  end

  def test_it_can_format_one_braille_letter_to_three_lines
    bc = BrailleConverter.new(nil)
    bc.encode_to_braille("a")
    assert_equal "0.", bc.top_line
    assert_equal "..", bc.middle_line
    assert_equal "..", bc. bottom_line
  end

  def test_it_can_format_two_braille_letter_to_three_lines
    bc = BrailleConverter.new(nil)
    bc.encode_to_braille("ab")
    assert_equal "0.0.", bc.top_line
    assert_equal "..0.", bc.middle_line
    assert_equal "....", bc. bottom_line
  end

  def test_it_can_format_one_braille_letter_to_one_of_three_lines
  end

  def test_that_output_is_three_lines
  end

  def test_can_get_top_line
    read_file = './lib/plain_message.txt'
    bc = BrailleConverter.new("help")
    assert_equal ["0.","0.","0.", "00"], bc.top_line
  end

  def test_can_get_middle_line
    read_file = './lib/plain_message.txt'
    bc = BrailleConverter.new(read_file)
    assert_equal ["00", ".0", "0.", "0."], bc.middle_line
  end

  def test_can_get_bottom_line
    read_file = './lib/plain_message.txt'
    bc = BrailleConverter.new(read_file)
    assert_equal ["..", "..", "0.", "0."], bc.bottom_line
  end

end
