#!/bin/ruby
# everyday scripting in ruby P.22

old_inventory = File.open('old-inventory.txt').readlines
new_inventory = File.open('new-inventory.txt').readlines

puts "The following files have been added:"
puts new_inventory - old_inventory

puts ""
puts "The following files have been deleted:"
puts old_inventory - new_inventory

# exercise 2.9.3 put the num_add, num_del, num_unchange

num_add = (new_inventory - old_inventory).length
num_del = (old_inventory - new_inventory).length
num_unchange = old_inventory.length - num_del

puts "add: %d, del %d, unchange %d" % [num_add, num_del, num_unchange]
