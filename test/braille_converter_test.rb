require 'minitest/autorun'
require 'minitest/pride'
require 'file_reader.rb'

#steps for file IO
#1 in shell, type ruby file.rb first.txt second.txt

class BrailleConverterTest <Minitest::Test
  # def setup
  # end

  def test_can_read_a_message_and_return_character_count
    reader = FileReader.new
    message = "hi friends"
    count = bc.count_message(message)
    #verify  - need to get message in and count out
    assert_equal 10, count
  end

  def test_can_open_file_and_return_count
    skip
    #setup
    filename = 'sample.txt'
    #object
    bc = BrailleConverter.new()
    #exercise
    count = bc.read_file(filename)

    assert_equal 7, count
  end

  def test_can_return_three_lines
  end
end
