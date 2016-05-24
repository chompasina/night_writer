# ***** uncomment the class and method once in brailler_converter and call on method read.
class FileReader
  def read_file
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
#   end
# end

# Using "w" mode on an existing file will erase the contents of that file. If you want to append to an existing file, use "a" as the second argument.
# message.txt = ARGV[0]
# braille.txt = ARGV[1]
