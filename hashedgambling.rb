require "digest"
ROCK = 0
PAPER = 1
SCISSORS = 2

# Generates a unique hash for the combination of choices using the SHA-256 hash function
def generate_hash(choice1, choice2)
  # Concatenate the choices to create a message
  message = "#{choice1}#{choice2}"

  # Use the SHA-256 hash function to generate a hash
  hash = Digest::SHA256.hexdigest(message)

  return hash
end

# Determines the winner of a round of rock-paper-scissors by looking up the corresponding hash in a hash table
def play_round(choice1, choice2)
  # Generate a unique hash for the combination of choices
  hash = generate_hash(choice1, choice2)

  # Look up the winner in the hash table
  return HASH_TABLE[hash]
end

# Creates a hash table that maps each hash to the corresponding winner
# This is done by generating a hash for each combination of choices and
# mapping it to the corresponding winner (:cpu1 or :cpu2)
HASH_TABLE = {
  generate_hash(ROCK, PAPER) => :cpu2,
  generate_hash(ROCK, SCISSORS) => :cpu1,
  generate_hash(PAPER, ROCK) => :cpu1,
  generate_hash(PAPER, SCISSORS) => :cpu2,
  generate_hash(SCISSORS, ROCK) => :cpu2,
  generate_hash(SCISSORS, PAPER) => :cpu1,
}

def main
  puts "Randomized rock paper scissors driven 1000 times.. Bet your shekels on one of the cpus, whoever wins the most out of a 1000 is the winner."
  usercontinue = true
  balance = 200
  while usercontinue
    puts "How much would you like to bet? Note: You currently have #{balance}"

    # Validate the user's input
    bet = nil
    until bet && bet > 0 && bet <= balance
      bet = gets.to_i
      if !bet || bet <= 0
        puts "Sorry, you must enter a positive integer for your bet."
      elsif bet > balance
        puts "Sorry, you do not have enough shekels to make that bet. Please enter a smaller amount."
      end
    end

    puts "Would you like to bet on CPU 1 or CPU 2?"
    cpubet = gets.to_i
    balance = rpsloop(bet, cpubet)
    puts "Your balance is now #{balance}, press enter to continue"
    gets

    # Ask the user if they want to continue
    puts "Would you like to continue playing? (y/n)"
    continue_response = gets.strip
    if continue_response == "n"
      usercontinue = false
    end
  end
end

def rpsloop(bet, selected_winner)
  puts "Now throwing rock paper scissors a thousand times.."
  cpu1_score = 0
  cpu2_score = 0

  # Play 1000 rounds
  1000.times do
    cpu1_choice = rand(3)
    cpu2_choice = rand(3)
    winner = play_round(cpu1_choice, cpu2_choice)

    if winner == :cpu1
      cpu1_score += 1
    elsif winner == :cpu2
      cpu2_score += 1
    end
  end

  puts "CPU 1 won a total of #{cpu1_score} times."
  puts "CPU 2 won a total of #{cpu2_score} times."

  # Determine the overall winner
  if cpu1_score > cpu2_score
    puts "CPU 1 won more games"
    if selected_winner == 1
      puts "Congrats you won and doubled your amount of shekels"
      bet *= 2
    elsif selected_winner == 2
      puts "Sorry you lost"
      bet /= 2
    end
  elsif
cpu2_score > cpu1_score
    puts "CPU 2 won more games"
    if selected_winner == 2
      puts "Congrats you won and doubled your amount of shekels"
      bet *= 2
    elsif selected_winner == 1
      puts "Sorry you lost"
      bet /= 2
    end
  else
    puts "The game was a tie"
  end

  return bet
end

main
