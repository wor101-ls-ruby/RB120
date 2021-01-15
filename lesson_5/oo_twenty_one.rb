require 'pry'

class Participant
  attr_accessor :hand, :total
  attr_reader :name

  def initialize(name)
    @hand = []
    @name = name
    @total = 0
  end

  def show_hand
    cards_in_hand = []
    hand.each { |card| cards_in_hand << card.to_s }
    cards_in_hand.join(', ')
  end

  def hit(deck, participant)
    puts "#{participant.name} chooses to hit!"
    deck.deal(1, participant)
  end

  def busted?
    if total > 21
      puts "#{name} busted!"
      true
    else
      false
    end
  end

  def calclate_total
    hand_total = with_ace_maximum_value
    return hand_total if hand_total <= 21 || no_aces?
    with_ace_minimum_value
  end

  def no_aces?
    hand.none? { |card| card.value == 'Ace' }
  end

  def non_ace_total
    hand_total = 0
    non_ace_cards = hand.select { |card| card.value != 'Ace' }
    non_ace_cards.each { |card| hand_total += card.point_value.first }
    hand_total
  end

  def with_ace_maximum_value
    hand_total = 0
    hand.each { |card| hand_total += card.point_value.last }
    hand_total
  end

  def with_ace_minimum_value
    hand_total = non_ace_total
    aces = hand.select { |card| card.value == 'Ace' }
    hand_total += if hand_total + 11 + (aces.size - 1) > 21
                    aces.size
                  else
                    11 + (aces.size - 1)
                  end
    hand_total
  end

  def to_s
    @name
  end
end

class Player < Participant
  attr_writer :name
end

class Dealer < Participant
  def show_initial_hand
    "#{hand.first} and an unknown card"
  end

  def initial_total
    hand.first.point_value.last
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
    @point_value = point_value
  end

  def to_s
    "#{value} of #{suit}"
  end

  def point_value
    @point_value = if %w(Jack Queen King).include?(value)
                     [10]
                   elsif value == 'Ace'
                     [1, 11]
                   else
                     [value.to_i]
                   end
  end
end

class Game
  TITLE = "Twenty One!"
  GREETING = "Welcome to Twenty One!"
  THANKS = "Thanks for playing Twenty One!"

  attr_reader :player, :dealer, :deck, :winner

  def initialize
    @deck = Deck.new
    @player = Player.new("Player")
    @dealer = Dealer.new("Dealer")
    @winner = nil
  end

  def start
    display_title(GREETING)
    set_player_name
    loop do
      setup
      player_turn
      dealer_turn
      show_result
      break if !play_again?
      reset
    end
  end

  def clear
    system 'clear'
  end

  def pause
    puts "Hit enter to continue:"
    gets.chomp
  end

  def display_title(title)
    puts "*" * 40
    puts title.center(40)
    puts "*" * 40
    puts " "
  end

  def set_player_name
    name = ''
    loop do
      puts "Please enter your name:"
      name = gets.chomp
      break if name.size > 1
      clear
      puts "Sorry your name must be at least 2 characters long."
    end
    player.name = name
  end

  def setup
    clear
    deal_cards
    update_totals
    show_initial_cards
  end

  def deal_cards
    @deck.deal(2, @player)
    @deck.deal(2, @dealer)
  end

  def update_totals
    player.total = player.calclate_total
    dealer.total = dealer.calclate_total
  end

  def show_initial_cards
    puts "#{dealer} has: #{dealer.show_initial_hand}" \
         " for a total of #{dealer.initial_total}"
    puts "#{player} has: #{player.show_hand}" \
         " for a total of #{player.total}"
    puts ""
  end

  def show_all_cards
    puts "#{dealer} has: #{dealer.show_hand}" \
         " for a total of #{dealer.total}"
    puts "#{player} has: #{player.show_hand}" \
         " for a total of #{player.total}"
    puts ""
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
    return unless player.busted? == false
    update_totals
    dealer_reveal
    show_all_cards
    pause
    loop do
      break if dealer.total >= 17 && dealer.total >= player.total
      update_dealer_hand
    end
  end

  def show_result
    clear
    display_title(THANKS)
    show_all_cards
    determine_winner
    declare_winner
  end

  def determine_winner
    return if win_by_bust?
    return if win_by_total?
  end

  def win_by_bust?
    if player.busted?
      @winner = dealer
      return true
    elsif dealer.busted?
      @winner = player
      return true
    end
    false
  end

  def win_by_total?
    if dealer.total > player.total
      @winner = dealer.name
      return true
    elsif player.total > dealer.total
      @winner = player.name
      return true
    end
    false
  end

  def declare_winner
    if @winner.nil?
      puts "It's a push!"
    else
      puts "#{winner} won!"
    end
  end

  def play_again?
    answer = ''
    loop do
      puts "Would you like to play again? (y, n)"
      answer = gets.chomp.downcase[0]
      break if %w(y n).include?(answer)
    end
    answer == 'y'
  end

  def reset
    @deck = Deck.new
    @winner = nil
    player.total = 0
    dealer.total = 0
    player.hand = []
    dealer.hand = []
  end

  def dealer_reveal
    clear
    puts "#{player} chooses to stay."
    puts "#{dealer} reveals a #{dealer.hand[1]}"
  end

  def update_dealer_hand
    clear
    dealer.hit(deck, dealer)
    puts "#{dealer} draws a #{dealer.hand.last}"
    update_totals
    show_all_cards
    pause
  end

  def stay?
    answer = ''
    loop do
      # binding.pry
      puts "Do you want to hit or stay? (h, s)"
      answer = gets.chomp.downcase[0]
      break if %w(hit stay h s).include?(answer)
      clear
      show_initial_cards
      puts "Sorry that is not a valid choice"
    end
    answer == 's'
  end
end

Game.new.start
