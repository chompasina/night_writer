
class FileReader
  def self.read_file(message_filename)
    handle = File.read(message_filename)
  end

  def self.write_file(written_filename, message)
    handle = File.write(written_filename, message)
    puts "Created '#{ARGV[1]}' containing #{message.length} characters"
  end
end
