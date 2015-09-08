require './lib/tree'
require './lib/node'

collection = []

input = File.open(ARGV[0], "r")
input.each_line do |line|
  collection << line.gsub("\n",'').to_i
end

output = File.open(ARGV[1], 'w')
sorted = collection.sort.join("\n")
output.write(sorted)
