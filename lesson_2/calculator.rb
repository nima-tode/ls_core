# ask the user for two numbers
# asks for the operation to perform
# perform the operation on the two numbers
# output results

puts("Welcome to Calculator!")

puts "What's the first number?"
answer1 = gets.chomp

puts "What's the second number?"
answer2 = gets.chomp

puts "What operation would you like the first number to use on the second number? 1) add 2) subtract 3) multiply 4) divide (1-4):"
operation = gets.chomp

if operation == "1"
	result = answer1.to_i + answer2.to_i
elsif operation == "2"
	result = answer1.to_i - answer2.to_i
elsif operation == "3"
	result = answer1.to_i * answer2.to_i
else
	result = answer1.to_f / answer2.to_f	
end

puts "The result is #{result}!"