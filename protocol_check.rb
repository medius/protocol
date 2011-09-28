require_relative 'message.rb'

# Get the input file name
if ARGV.length > 1
  puts "Usage: ruby protocol_check <input file>"
  exit -1
end

filename = ARGV[0]
file = File.new(filename, "r")

# Parse the input messages
message = Message.new

while line = file.gets
  line = line.gsub(/\n/,"")
  line = line.gsub(/\s+/," ")
  messages = line.split(" ")
  
  # Check if each message on the line is valid
  messages.each do |msg|
    message.value = msg;
    
    if message.is_valid?
      puts "#{msg} VALID"
    else
      puts "#{msg} INVALID"
    end
  end
end

  



