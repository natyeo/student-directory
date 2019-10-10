puts "Hello, I read and print out my own source code"

f = File.open(__FILE__)

f.each_line do |line|
    puts line
end 