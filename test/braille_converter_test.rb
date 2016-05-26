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
    file_name = './lib/message.txt'
    bc = BrailleConverter.new(file_name)
    reader = FileReader.read_file(file_name)
    message = "hi friends"
    count = bc.count_message(message)
    assert_equal "10", count
  end

  def test_can_open_file_and_return_count
    skip
    file_name = './lib/message.txt'
    bc = BrailleConverter.new(file_name)
      reader = FileReader.read_file(file_name)
    count = bc.count_message(message)
    assert_equal 13, count
  end

  def test_if_converter_can_load_file
    file_name = './lib/message.txt'
    bc = BrailleConverter.new(file_name)
    assert bc.reader
    assert bc.reader.include?("hi friends")
  end

  def test_can_return_three_lines
    file_name = './lib/message.txt'
    bc = BrailleConverter.new(file_name)
    bc.triple_lines
  end

  def test_it_can_convert_a_single_english_letter
    bc = BrailleConverter.new('./lib/message.txt')
    result = bc.translate_english_to_braille("a")
    assert_equal [["0.","..",".."]], result
  end

  def test_it_can_translate_multiple_english_letters
    bc = BrailleConverter.new(nil)
    result = bc.translate_english_to_braille("ab")
    assert_equal [["0.","..",".."], ["0.","0.",".."]], result
  end

  def test_it_can_output_spaces_between_words
    bc = BrailleConverter.new(nil)
    result = bc.translate_english_to_braille("a b")
    assert_equal [["0.","..",".."], ["..", "..", ".."], ["0.","0.",".."]], result
  end

  def test_it_can_output_a_symbol
    bc = BrailleConverter.new(nil)
    result = bc.translate_english_to_braille("a! b")
    assert_equal [["0.","..",".."], ["..","00","0."], ["..", "..", ".."], ["0.","0.",".."]], result
  end

  def test_it_can_output_braille_to_file
    file_name = './lib/message.txt'
    bc = BrailleConverter.new(file_name)
    result = bc.format_braille_to_lines("a! b")
    assert_equal [["0.","..",".."], ["..","00","0."], ["..", "..", ".."], ["0.","0.",".."]], result
  end

  def test_it_can_format_one_braille_letter_to_one_of_three_lines
    bc = BrailleConverter.new(nil)
    result = bc.format_braille_to_lines("a")
    assert_equal ["0."], bc.line_1
  end

  def test_it_can_format_two_braille_letters_to_one_of_three_lines
    bc = BrailleConverter.new(nil)
    bc.format_braille_to_lines("ab")
    assert_equal "0.0.", bc.line_1
  end

  def test_it_can_format_one_braille_letter_to_two_of_three_lines
    bc = BrailleConverter.new(nil)
    bc.format_braille_to_lines("a")
    assert_equal "0.", bc.line_1
    assert_equal "..", bc.line_2
  end

  def test_it_can_format_one_braille_letter_to_three_lines
    bc = BrailleConverter.new(nil)
    bc.format_braille_to_lines("a")
    assert_equal "0.", bc.line_1
    assert_equal "..", bc.line_2
    assert_equal "..", bc. line_3
    # binding.pry
  end

  def test_it_can_format_two_braille_letter_to_three_lines
    skip
    bc = BrailleConverter.new(nil)
    bc.format_braille_to_lines("ab")
    assert_equal "0.0.", bc.line_1
    assert_equal "..0.", bc.line_2
    assert_equal "....", bc. line_3
  end

  def test_it_can_format_one_braille_letter_to_one_of_three_lines
  end

  def test_that_output_is_three_lines
  end

  def test_can_get_top_line
    file_name = './lib/message.txt'
    bc = BrailleConverter.new(file_name)
    assert_equal ["0.","0.","0.", "00"], bc.top_line
  end

  def test_can_get_middle_line
    file_name = './lib/message.txt'
    bc = BrailleConverter.new(file_name)
    assert_equal ["00", ".0", "0.", "0."], bc.middle_line
  end

  def test_can_get_bottom_line
    file_name = './lib/message.txt'
    bc = BrailleConverter.new(file_name)
    assert_equal ["..", "..", "0.", "0."], bc.bottom_line
  end

end
