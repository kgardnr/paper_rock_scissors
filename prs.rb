OPTIONS = {"p" => "Paper", "r" => "Rock", "s" => "Scissors"}

def play_game
  
  def say(message)
    puts "### #{message}"
  end

  def display_winning_message(winning_choice)
    case winning_choice
    when "p"
      say "Paper covers Rock."
    when "r"
      say "Rock breaks Scissors."
    when "s"
      say "Scissors cuts Paper."
    end
  end

  say "Let's play Paper, Rock, Scissors!"

  begin
    say "Choose one: P/R/S"
    player_choice = gets.chomp.downcase
  end until OPTIONS.keys.include?(player_choice)

  computer_choice = OPTIONS.keys.sample

  say "You picked #{OPTIONS[player_choice]} and the computer picked #{OPTIONS[computer_choice]}."

  if player_choice == computer_choice
    say "It's a tie!"
  elsif player_choice == "p" && computer_choice == "r" ||
        player_choice == "r" && computer_choice == "s" ||
        player_choice == "s" && computer_choice == "p"
    display_winning_message(player_choice)
    say "You win!"
  else
    display_winning_message(computer_choice)
    say "The computer wins!"
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
