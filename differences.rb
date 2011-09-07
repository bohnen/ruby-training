#!/bin/ruby
# everyday scripting in ruby P.22

def check_usage
  unless ARGV.length == 2
    puts "Usage: difference.rb old-inventory.txt new-inventory.txt"
    exit
  end
end

# PP.64 exercise 3
def contains?(line,name)
  line.split('/').include?(name)
end

def boring?(line,boring_words)
  boring_words.any? do | a_boring_word |
    contains?(line,a_boring_word)
  end
end

def inventory_from(filename)
  inventory = File.open(filename)
  downcased = inventory.readlines.collect do |l|
    l.chomp.downcase
  end
  downcased.reject do | l |
    boring?(l,['temp','recycler'])
  end
end

def compare_inventory_files(old_file,new_file)
  old_inventory = inventory_from(ARGV[0])
  new_inventory = inventory_from(ARGV[1])

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
end

if $0 == __FILE__
  check_usage
  compare_inventory_files(ARGV[0],ARGV[1])
end
