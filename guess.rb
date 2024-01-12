class Game
  def initialize(level)
    @level = level
  end

  def start
    case @level
    when 1 
      secret_number = rand(1..20)
    when 2
      secret_number = rand(1..50)
    when 3
      secret_number = rand(1..100)
    else
      puts "Choose the existing level only!"
      return
    end

    start_game(secret_number)
  end

  def scorer(count, user_number, secret_number)
    if count == 1 && user_number == secret_number
      score = 100
    elsif count == 2 && user_number == secret_number
      score = 80
    elsif count == 3 && user_number == secret_number
      score = 60
    elsif count == 4 && user_number == secret_number
      score = 40
    elsif count == 5 && user_number == secret_number
      score = 20
    elsif count == 6 && user_number == secret_number
      score = 10
    else
      score = 0
    end
  end

  def start_again(secret_number)
    start_game(secret_number)
  end

  def exit_game
    puts "Thank you for playing!"
  end

  def start_game(secret_number)
    count = 0
    guessed_numbers = [] 
    score = 0
    play_again = "N"

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
      puts "You have guessed: #{guessed_numbers}" 
    
      if user_number < secret_number
        puts "Oops! The number you guess is lower than the secret number. Please try again." 
      elsif user_number > secret_number
        puts "Aahh that's too high! Please try again."
      else
        puts "Yay! Congratulation. You guessed it right!"

        score = scorer(count + 1, user_number, secret_number)
        puts "Your score is: #{score}"
        puts "Do you want to play again? Y(Yes) or N(No)"
        play_again = gets.chomp.upcase
        break
      end
    
      count += 1
    end

    case play_again
    when "Y"
      start_again(secret_number)
    when "N"
      exit_game
    else
      puts "Invalid!"
    end
  end
end

puts "Hello. Welcome to Angell Guess Game!"
puts "Please choose the level you would like to play: 1) Easy Level 2) Medium Level 3) Hard Level"
level = gets.chomp.to_i

game = Game.new(level)
game.start
