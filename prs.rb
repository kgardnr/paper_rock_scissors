require 'pry'

def play_game

  def say(message)
    puts "=> #{message}"
  end

  say "Choose one: P/R/S"
  player_choice = gets.chomp.downcase

  computer_options = ["p", "r", "s"]
  computer_choice = computer_options.sample.downcase

  case player_choice
  when "p"
    player_choice_verbose = "Paper"
  when "r"
    player_choice_verbose = "Rock"
  when "s"
    player_choice_verbose = "Scissors"
  end

  case computer_choice
  when "p"
    computer_choice_verbose = "Paper"
  when "r"
    computer_choice_verbose = "Rock"
  when "s"
    computer_choice_verbose = "Scissors"
  end
  say "You picked #{player_choice_verbose} and the computer picked #{computer_choice_verbose}."


  if player_choice == "p" && computer_choice == "r"
    say "Paper covers Rock. You win!"
  elsif computer_choice == "p" && player_choice == "r"
    say "Paper covers Rock. The computer wins!"
  elsif player_choice == "r" && computer_choice == "s"
    say "Rock breaks Scissors. You win!"
  elsif computer_choice == "r" && player_choice == "s"
    say "Rock breaks Scissors. The computer wins!"
  elsif player_choice == "s" && computer_choice == "p"
    say "Scissors cut Paper. You win!"
  elsif computer_choice == "s" && player_choice == "p"
    say "Scissors cut Paper. The computer wins!"
  else
    say "It's a tie!"
  end 

  say "Play again? Y/N"
  play_again = gets.chomp.downcase

  if play_again == "y"
    play_game
  else
    say "Thanks for playing!"
  end
end

play_game
