#pontoon game
player_score =0
dealer_score =0

loop do


  deck = []
  4.times do
  deck.push "A" , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , "J" , "Q" , "K"

  end

  deck.shuffle!

  player = [deck.pop , deck.pop]
  dealer = [deck.pop , deck.pop]

  def value (hand)
    total = 0
    used_ace =false
    hand.each do |card|
      if ["J", "Q", "K"].include? card
        total = total + 10
        next
      end

      if card == "A"
        
          if used_ace
            total = total + 1
          else
            total = total +11
          end
          used_ace = true
        next
      end

      total = total + card

      if total > 21 and used_ace
          total = total -10
      end

    end

    return total
  end
  puts player
  puts value player

  # the main 
  puts  "dealer has: #{dealer[0]} and ?"

  #player loop

    20.times do
      puts "your hand: #{value player} #{player} " 

      if value(player) > 21
      puts "you're bust"
      dealer_score +=1
      break
      end
      
      if value(player) == 21
        puts "you win"
        player_score +=1
        break
      end

      puts "stick (s) or Twist (t)?"
      move = gets.strip.downcase

      if move == "s"
        break
      end

      if move == "t"
        player.push deck.pop
      end
    end

    if value(player) <21
    #Dealer loop
    20.times do
    puts "Dealer has #{value dealer} #{dealer}"

    if  value(dealer) >21
      puts "Dealer is bust you win"
      player_score +=1
      break
    end

    if value(dealer) == 21
      puts "Dealer wins! too bad for you."
      dealer_score +=1
      break
    end
    
  if value(dealer) <= value(player)
    puts "Dealer twists"
    dealer.push deck.pop
  else
  puts "Dealer Sticks! you loose!"
  dealer_score +=1
  break
  end
    end


  end
  puts "your score: #{player_score}"
  puts "dealer scoreL #{dealer_score}"
   puts " play again? (y/n)"
    play = gets.strip.downcase
    if  play == "n"
      break
    end
end
