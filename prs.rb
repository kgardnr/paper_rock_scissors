require 'pry'

OPTIONS = {"p" => "Paper", "r" => "Rock", "s" => "Scissors"}

def say(message)
  puts "### #{message}"
end

def display_winning_message(winning_choice)
  case winning_choice
  when "p" then say "Paper covers Rock."
  when "r" then say "Rock breaks Scissors."
  when "s" then say "Scissors cuts Paper."
  end
end

def tally_scores(scores, score)
  scores << score
end

def display_scores(player_scores, computer_scores)
  puts "Your Score: #{player_scores}"
  puts "Computer Score: #{computer_scores}"
end

def play_game(player_scores = [], computer_scores = [])

  say "Let's play Paper, Rock, Scissors!"

  begin
    say "Choose one: P/R/S"
    player_choice = gets.chomp.downcase
  end until OPTIONS.keys.include?(player_choice)

  computer_choice = OPTIONS.keys.sample

  say "You picked #{OPTIONS[player_choice]} and the computer picked #{OPTIONS[computer_choice]}."

  if player_choice == computer_choice
    say "It's a tie!"
    tally_scores(player_scores, 0)
    tally_scores(computer_scores, 0)
  elsif player_choice == "p" && computer_choice == "r" ||
        player_choice == "r" && computer_choice == "s" ||
        player_choice == "s" && computer_choice == "p"
    display_winning_message(player_choice)
    tally_scores(player_scores, 1)
    tally_scores(computer_scores, 0)
    say "You win!"
  else
    display_winning_message(computer_choice)
    tally_scores(computer_scores, 1)
    tally_scores(player_scores, 0)
    say "The computer wins!"
  end 
  
  display_scores(player_scores, computer_scores)

  say "Play again? Y/N"
  play_again = gets.chomp.downcase

  if play_again == "y"
    play_game(player_scores, computer_scores)
  else
    say "Thanks for playing!"
  end
end

play_game
