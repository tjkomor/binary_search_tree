require './lib/tree'
require './lib/node'

collection = []

input = File.open(ARGV[0], "r")
input.each_line do |line|
  collection << line.gsub("\n",'').to_i
end

tree = Tree.new(collection[0])
collection[1..-1].each do |num|
  tree.insert(num)
end

sorted = tree.sort.join("\n")

output = File.open(ARGV[1], 'w')
output.write(sorted)
