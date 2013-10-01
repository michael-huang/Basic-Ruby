puts "=> What's the first number?"
number1 = gets.chomp

puts "=> What's the second number?"
number2 = gets.chomp

puts "randomly choosing operation..."

arr = ['1', '2', '3', '4']
operation = arr[rand(4)]

if operation == '1'
	result = number1.to_i + number2.to_i
  	operation = "add"
elsif operation == "2"
  	result = number1.to_i - number2.to_i
  	operation = "subtract"
elsif operation == "3"
  	result = number1.to_f / number2.to_f
  	operation = "divided by"
else
	result = number1.to_i * number2.to_i
  	operation = "multiply"
end

puts "=> #{number1} #{operation} #{number2} is #{result}"