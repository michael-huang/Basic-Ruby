class Cards
	attr_accessor :suit, :value
	def initialize(suit, value)
		@suit = suit
		@value = value
	end

	def to_s
		"The #{value} of #{suit}"
	end
end

module Hand
	def show_cards
    puts "---- #{name}'s cards ----"
		cards.each{ |card| puts "#{card}"}
		puts "Total = #{total}"
	end

	def total
		arr = cards.map{|card| card.value}
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
    	timesotal -= 10 if total > 21
  		end

  		total
		
	end

	def is_busted?
    	total > Blackjack::BLACKJACK_AMOUNT
  end

  def add_card(new_card)
    cards << new_card
  end

  def is_busted?
    total > Blackjack::BLACKJACK_AMOUNT
  end
end

class Deck
	attr_accessor :cards

	def initialize
		@cards = []
		suits_arr = ['Spade', 'Heart', 'Diamond', 'Club']
		cards_arr = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

		suits_arr.each do |suit|
			cards_arr.each do |value|
				@cards << Cards.new(suit, value)
			end
		end

		@cards.shuffle!
	end

	def deal
		@cards.pop
	end
end

class Player
	include Hand
  attr_accessor :name, :cards
  
	def initialize(name)
		@name = name		
		@cards = []
	end	
end

class Dealer
  include Hand
  attr_accessor :name, :cards

  def initialize    
    @name = 'dealer'
    @cards = []
  end 

  def show_flop
    puts "--- Dealer's cards ---"
    puts "the first card is hidden"
    puts "the second card is #{cards[1]}"
  end
end

class Blackjack
	BLACKJACK_AMOUNT = 21
	DEALER_HIT_MIN = 17

  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new('Player')
    @dealer = Dealer.new
  end
  
  def set_player_name
    puts "What's your name?"
    player.name = gets.chomp
  end

  def deal_cards
      player.add_card(@deck.deal)
      dealer.add_card(@deck.deal)
      player.add_card(@deck.deal)
      dealer.add_card(@deck.deal)
  end

  def show_flop
      player.show_cards
      dealer.show_flop
  end

  def blackjack_or_busted?(player_or_dealer)
    if player_or_dealer.total == BLACKJACK_AMOUNT
      if player_or_dealer.is_a?(Player)
        puts "Congratulations! #{player.name} hit blackjack, #{player.name} win!"
      else
        puts "Sorry, dealer hit blackjack, #{player.name} loses"
      end
      play_again?

    elsif player_or_dealer.is_busted?
      if player_or_dealer.is_a?(Player)
        puts "Sorry, #{player.name} busted, dealer win!"
      else
        puts "Congratulations! dealer busted, #{player.name} win"
      end
      play_again?
    end
  end

  def player_turn
    puts "\n#{player.name}'s turn"
    blackjack_or_busted?(player)

    while !player.is_busted?
      puts "What's your next move? 1) hit 2) stay"
      decision = gets.chomp
      if !['1', '2'].include?(decision)
        puts "You have to choose 1 or 2"
      end

      if decision == '1'
        player.add_card(deck.deal)
        player.show_cards
      else
        break
      end
      blackjack_or_busted?(player)
    end
    puts "#{player.name} stays at #{player.total}."
  end

  def dealer_turn
    puts "\nDealer's turn."

    blackjack_or_busted?(dealer)
    while dealer.total < DEALER_HIT_MIN
      dealer.add_card(deck.deal)
      dealer.show_cards
      blackjack_or_busted?(dealer)
    end
    puts "Dealer stays at #{dealer.total}."
  end

  def play_again?
    puts "\nWould you like to play again? 1) yes 2) no"
    if gets.chomp == '1'
      puts "Starting new game..."
      puts ""
      deck = Deck.new
      player.cards = []
      dealer.cards = []
      start
    else
      puts "Goodbye!"
      exit
    end
  end

  def who_won?
    if player.total > dealer.total
      puts "Congratulations! #{player.name} won!"
    elsif player.total < dealer.total
      puts "Sorry, dealer won, #{player.name} loses"
    else
      puts "It's tie"
    end
    play_again?
  end

	def start
		set_player_name
    deal_cards
    show_flop
    player_turn
    dealer_turn
    who_won?
	end
end

game = Blackjack.new
game.start

