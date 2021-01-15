require 'pry'

module Hand
attr_reader :hand
  def show_hand
    #binding.pry
    cards_in_hand = []
    hand.each { |card| cards_in_hand << card.to_s }
    cards_in_hand.join(', ')
  end
end
    

class Participant
  include Hand

  attr_accessor :hand, :total
  attr_reader :name
  
  def initialize(name)
    @hand = []
    @name = name
    @total = 0
  end
  
  def hit(deck, participant)
    puts "#{participant.name} chooses to hit!"
    deck.deal(1, participant)
  end
  
  def stay
    puts "You stay!"
  end
  
  def busted?
    if total > 21
      puts "#{name} busted!"
      return true
    else
      false
    end
  end
  
  def calclate_total
    hand_total = with_ace_maximum_value
    return hand_total if hand_total <= 21
    with_ace_minimum_value
  end
  
  def with_ace_maximum_value
    hand_total = 0
    hand.each { |card| hand_total += card.get_point_value.last }
    hand_total
  end
  
  def with_ace_minimum_value
    hand_total = 0
    hand.each { |card| hand_total += card.get_point_value.first }
    hand_total   
  end
end

class Player < Participant

end

class Dealer < Participant
  include Hand

  def deal
    # does the dealer or the deck deal?
  end
  
  def show_initial_hand
    "#{hand.first} and an unknown card"
  end
  
  def initial_total
    hand.first.get_point_value.last
  end
  
end

class Deck
  SUITS = %w(Hearts Diamonds Clubs Spades)
  VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
  
  attr_reader :cards
  
  def initialize
    @cards = []
    create_deck
  end
  
  def deal(cards, participant)
    cards_drawn = @cards.shift(cards)
    cards_drawn.each { |card| participant.hand << card }
  end
  
  def shuffle_deck
    @cards.shuffle!
  end
  
  private 
  
  def create_deck
    SUITS.each do |suit|
      VALUES.each { |value| @cards << Card.new(suit, value) }
    end
    shuffle_deck
  end
end

class Card
  attr_reader :suit, :value
  
  def initialize(suit, value)
    @suit = suit
    @value = value
    @point_value = get_point_value
  end
  
  def to_s
    "#{value} of #{suit}"
  end
  
  def get_point_value
    if %w(Jack Queen King).include?(value)
      @point_value = [10]
    elsif value == 'Ace'
      @point_value = [1, 11]
    else
      @point_value = [value.to_i]
    end
  end
end

class Game
  attr_reader :player, :dealer, :deck


  def initialize
    @deck = Deck.new
    @player = Player.new("Player")
    @dealer = Dealer.new("Dealer")
  end
  
  def start
    deal_cards
    update_totals
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
  
  def clear
    system 'clear'
  end
  
  def pause
    puts "Hit enter to continue:"
    gets.chomp
  end
  
  def deal_cards
    #@deck.cards.each { |card| puts " #{card.value} of #{card.suit}" }
    @deck.deal(2, @player)
    @deck.deal(2, @dealer)
  end
  
  def update_totals
    player.total = player.calclate_total
    dealer.total = dealer.calclate_total
  end
  
  def show_initial_cards
    puts "Dealer has: #{dealer.show_initial_hand} for a total of #{dealer.initial_total}"
    puts "Player has: #{player.show_hand} for a total of #{player.total}"
  end
  
  def show_all_cards
    puts "Dealer has: #{dealer.show_hand} for a total of #{dealer.total}"
    puts "Player has: #{player.show_hand} for a total of #{player.total}"
  end
  
  def player_turn
    loop do
      break if stay?
      player.hit(deck, player)
      update_totals
      clear
      show_initial_cards
      break if player.busted?
    end
  end

  def dealer_turn
    if player.busted? == false
      update_totals
      dealer_reveal
      show_all_cards
      pause
      loop do
        break if dealer.total >= 17 && dealer.total >= player.total
        update_dealer_hand
      end
    end
  end
  
  def show_result
    clear
    show_all_cards
    if player.busted? 
      puts "#{dealer.name} won!"
    elsif dealer.busted?
      puts "#{player.name} won!"
    elsif dealer.total > player.total 
      puts "#{dealer.name} won!"
    elsif player.total > dealer.total 
      puts "#{player.name} won!"
    else
      puts "It's a push!"
    end
  end
  
  def dealer_reveal
    clear
    puts "#{player.name} chooses to stay."
    puts "#{dealer.name} reveals a #{dealer.hand[1]}"
  end
  
  def update_dealer_hand
      clear
      dealer.hit(deck, dealer)
      puts "#{dealer.name} draws a #{dealer.hand.last}"
      update_totals
      show_all_cards
      pause
  end
  
  def stay?
    answer = ''
    loop do
      puts "Do you want to hit or stay? (h, s)"
      answer = gets.chomp.downcase[0]
      break if %w(hit stay h s).include?(answer)
      clear
      show_initial_cards
      puts "Sorry that is not a valid choice"
    end
    answer == 's' ? true : false
  end
end

Game.new.start