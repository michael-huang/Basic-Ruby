arr = [1,2,3,4,5,6,7,8,9,10]

# exercise1
puts "\nexercise1:"
arr.each do |element|
	puts element
end

# exercise2
puts "\nexercise2:"
arr.each { |element| puts element if element > 5 }

# exercise3
puts "\nexercise3:"
new_arr = arr.select {|element| element%2 != 0}
puts new_arr

# exercise4
puts "\nexercise4:"
arr << 11
arr.unshift 0
puts arr

# exercise5
puts "\nexercise5:"
arr.pop
arr << 3
puts arr

# exercise6
puts "\nexercise6:"
puts arr.uniq

# exercise7
puts "\nexercise7:"
puts "a hash has key/value pairs, an array just has a sequence of elements(index-based from zero), in general, hash order is not guaranteed in other languages, hash just key/value pairs, that's it, there is nothing else to think about.
In Ruby, hashes enumerate their values in the order that the corresponding keys were inserted. And indexing of a hash is done via arbitrary keys of any object type, you can use any object to refer to a slot, not just a number."

# exercise8
puts "\nexercise8:"
hash_1_8 = {:a => 1, :b => 2, :c => 3, :d => 4}
hash_1_9 = {a:1, b:2, c:3, d:4}
puts hash_1_8.to_s
puts hash_1_9.to_s

# exercise9
puts "\nexercise9:"
puts hash_1_9[:b]

# exercise10
puts "\nexercise10:"
hash_1_9[:e] = 5
puts hash_1_9

# exercise13
puts "\nexercise13:"
# hash_1_9.each {|k,v| hash_1_9.delete k if v < 3.5}
hash_1_9.delete_if {|k,v| v < 3.5}
puts hash_1_9

# exercise14
puts "\nexercise14:"
hash_1_9[:a] = arr
puts hash_1_9

# exercise15
puts "\nexercise15:"
puts "I like ruby-doc.org, because it's comprehensive and well-organized."