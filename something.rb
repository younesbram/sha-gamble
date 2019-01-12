def main
	puts"Randomized rock paper scissors driven 1000 times.. Bet your shekels on one of the cpus, whoever wins the most out of a 1000 is the winner."
  usercontinue = true
  balance = 200
  while usercontinue
    puts"How much would you like to bet? Note: You currently have #{balance}"
    bet = gets.to_i
    until bet < balance + 1 && bet > 0
      puts"Sorry you entered something wrong for the bet, take into account you only have 200 shekels at the start."
      bet = gets.to_i
    end
    puts"Would you like to bet on CPU 1 or CPU 2?"
    cpubet = gets.to_i
    balance = rpsloop(bet,cpubet)
    puts"Your balance is now #{balance}, press enter to continue"
    flag = gets
   # if flag == "yes" || flag == "y"
    #  usercontinue = true
   # elsif flag == "no"
   #   usercontinue = false  
   # end
   
  end
end
def rpsloop(bet,selectedwinner)
	puts"Now throwing rock paper scissors a thousand times.."
	counter = 0 
	score_counter_a = 0
	score_counter_b = 0
	until counter == 1000
    counter += 1
		cpu_choice_a = rand(2)
		cpu_choice_b = rand(2)
   	 # 0 is rock, 1 is paper, 2 is scissors.
    if cpu_choice_a == 0 && cpu_choice_b == 1 || cpu_choice_a == 1 && cpu_choice_b == 2 || cpu_choice_a == 2 && cpu_choice_b == 0
		  score_counter_b += 1
    elsif cpu_choice_b == 0 && cpu_choice_a == 1 || cpu_choice_b == 1 && cpu_choice_a == 2 || cpu_choice_b == 2 && cpu_choice_a == 0
      score_counter_a += 1
    end
	end
  puts"CPU 1 won a total of #{score_counter_a} times. \nCPU 2 won a total of #{score_counter_b} times."
  if score_counter_a > score_counter_b
    puts"CPU 1 won more games"
    if selectedwinner == 1
    	bet *= 2
  	elsif selectedwinner == 2
      puts"Sorry you lost"
  		bet /= 2
  	end
  elsif score_counter_b > score_counter_a
    puts"CPU 2 won more games"
    if selectedwinner == 2
      puts"Congrats you won and doubled your amount of shekels"      
    	bet*=2
    elsif selectedwinner == 1
      puts"Sorry you lost"
    	bet/=2
  return bet
  end
end
end
main