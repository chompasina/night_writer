require 'minitest/autorun'
require 'minitest/pride'
require './lib/file_reader.rb'

class FileReaderTest < Minitest::Test

  def test_that_it_can_read_and_write_to_a_text_file
    w = FileReader.write_file('./lib/message.txt', "hello world")
    assert_equal "hello world", FileReader.read_file('./lib/message.txt')
  end

end
