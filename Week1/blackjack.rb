def total(cards)
	arr = cards.map{|element| element[1]}
	total = 0
	arr.each do |value|
		if value == "A"
      		total += 11
    	elsif value.to_i == 0
      		total += 10
    	else
      		total += value.to_i
      	end
    end

    arr.select{|element| element == "A"}.count.times do
    	total -= 10 if total > 21
  	end

  	total
end

puts "\nWelcome to blackjack! What's your name?"
name = gets.chomp
play_again = '1'


while play_again == '1'

	suits_arr = ['S', 'H', 'D', 'C']
	cards_arr = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

	deck = suits_arr.product(cards_arr)
	deck.shuffle!

	player_cards = []
	dealer_cards = []

	puts "\ndealing..."
	player_cards << deck.pop
	dealer_cards << deck.pop
	player_cards << deck.pop
	dealer_cards << deck.pop

	player_total = total player_cards
	dealer_total = total dealer_cards

	puts "Dealer got #{dealer_cards}, total = #{dealer_total}"
	puts "#{name}, you got #{player_cards}, total = #{player_total}}"
	puts "\nWhat's your next move? 1) hit  2) stay"
	decision = gets.chomp

	player_lose = false

	while decision == 1.to_s && player_total < 21
		player_cards << deck.pop
		player_total = total player_cards
		puts "Now you got #{player_cards}, total = #{player_total}}"

		if player_total < 21
			puts "What's your next move? 1) hit  2) stay"
			decision = gets.chomp
		elsif player_total > 21
			puts "Busted! YOU LOSE"	
			player_lose = true
		end
	end

	while dealer_total < 17 || dealer_total < player_total
		dealer_cards << deck.pop
		dealer_total = total dealer_cards
	end

	if !player_lose
		puts "Dealer got #{dealer_cards}, total = #{dealer_total}"
		puts "#{name}, you got #{player_cards}, total = #{player_total}}"

		if player_total > dealer_total || dealer_total > 21
			puts "You Win!!"
		else
			puts "You Lose!!"
		end
	end

	puts "Do you wanna play again, #{name}? 1) yes  2)no"
	play_again = gets.chomp
end