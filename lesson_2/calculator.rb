# ask the user for two numbers
# asks for the operation to perform
# perform the operation on the two numbers
# output results
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'en'

def messages(message, lang = 'en')
	MESSAGES[lang][message]
end

def prompt(key)
	message = messages(key, LANGUAGE)
	Kernel.puts("=> #{message}")
end

def number?(number)
	valid_number?(number) || valid_float?(number)
end

def valid_float?(num)
	/\d/.match(num) && /^-?\d*\.?\d*$/.match(num)
end

def valid_number?(num)
	num.to_i.to_s == num
end 

def operation_to_message(op)
	case op
	when '1'
		'Adding'
	when '2'
		'Subtracting'
	when '3'
		'Multiplying'
	when '4'
		'Dividing'
	end
end

prompt('welcome')
name = ''

loop do
	name = Kernel.gets().chomp()

		if name.empty?()
			prompt('valid_number')
		else
			break
		end
end

prompt('hi_name')

loop do
	answer1 = ''
	answer2 = ''

	loop do
		prompt('enter_number')
		answer1 = gets.chomp

			if number?(answer1)
				break
			else
				prompt('invalid_number')
			end
	end

	loop do	
		prompt('enter_number')
		answer2 = gets.chomp

			if number?(answer2)
				break
			else
				prompt('invalid_number')
			end
	end
	
	prompt('operator_prompt')
	
	operator = ''
		loop do
			operator = Kernel.gets().chomp()

			if %w[1 2 3 4].include?(operator)
				break
			else
				prompt('invalid_operator')
			end
		end
	
	prompt('loading')
	result =	case operator
				 		when '1'
				 			answer1.to_i + answer2.to_i
					 	when '2'
				 			answer1.to_i - answer2.to_i
				 	 	when '3'
				 			answer1.to_i * answer2.to_i
				 	 	when '4'
				 			answer1.to_f / answer2.to_f
				 		end
	
	prompt('result')

	prompt("Do you want to perform another calculation?")
	answer = Kernel.gets().chomp()
	break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using the calculator. Bye!")
