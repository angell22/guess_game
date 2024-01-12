def easy_level
  secret_number = rand(1..20)
  start_game (secret_number)
end

def medium_level
  secret_number = rand(1..50)
  start_game (secret_number)
end

def hard_level
  secret_number = rand(1..100)
  start_game (secret_number)
end

def start_game(secret_number)
  count = 0
  guessed_numbers = [] 

  while count < 6
    user_number = 0
  
    loop do
      puts "Guess a number: "
      user_number = gets.chomp.to_i
  
      if guessed_numbers.include?(user_number)
        puts "You've already guessed that number. Try again."
        puts "You have guessed: #{guessed_numbers}"
      else
        guessed_numbers << user_number
        break
      end
    end
  
    puts "You chose #{user_number}"
    puts "Your have guessed: #{guessed_numbers}" 
  
    if user_number < secret_number
      puts "Oops! The number you guess is lower than the secret number. Please try again." 
    elsif user_number > secret_number
      puts "Aahh that's too high! Please try again."
    else
      puts "Yay! Congratulation. You guessed it right!"
      break
    end
  
    count += 1
  end
end

puts "Hello. Welcome to Angell Guess Game!"
puts "Please choose the level you would like to play: 1) Easy Level 2) Medium Level 3) Hard Level"
level = gets.chomp.to_i

case level
when 1 
  easy_level
when 2
  medium_level
when 3
  hard_level
else
  puts "Choose the existing level only!"
end



