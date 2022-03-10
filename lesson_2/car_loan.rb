#Car Loan Calculator - 03.09.22

def prompt(message)
  puts "=> #{message}"
end

def monthly_rate(annual_rate)
  annual_rate / 12
end

def duration_months(duration_year)
  duration_year * 12
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

prompt("Welcome to the Car Loan Calculator!")
prompt("-----------------------------------")

prompt("Please enter the total amount of your loan:")

loan_amount = 
loop do

loan_amount = gets.chomp.to_f

  if valid_number?(loan_amount)
    break
  else
    prompt("Please enter a valid number:")
  end
end

loop do
prompt("Please enter the APR on your loan - (use decimals: 25% = .25):")
apr = gets.chomp.to_f
  
  if valid_number?(apr)
    break
  else
    prompt("Please enter a valid number")
  end
end

m_rate = monthly_rate(apr)

loop do
prompt("Please enter your loan duration in years:")
duration_total = gets.to_f
  if valid_number?(duration_total)
    break
  else
    prompt("Please enter the number of years in decimal form:")
  end
end

m_duration = duration_months(duration_total)

prompt("Calculating your monthly payment!")
monthly_payment = loan_amount * (m_rate / (1 - (1 + m_rate) ** (-m_duration)))
p monthly_payment

