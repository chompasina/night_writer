require './lib/file_reader'
require './lib/braille_converter'

message_filename = ARGV[0]
written_filename = ARGV[1]
message_contents = FileReader.read_file(message_filename)


bc = BrailleConverter.new(ARGV[0], ARGV[1])
bc.encode_to_braille(message_contents)
bc.top_line
bc.middle_line
bc.bottom_line
bc.total_lines


FileReader.write_file(written_filename, bc.total_lines)
