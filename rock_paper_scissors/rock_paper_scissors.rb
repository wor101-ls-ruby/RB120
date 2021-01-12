class Move
  VALUES = ['rock', 'paper', 'scissors', 'spock', 'lizard']

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def spock?
    @value == 'spock'
  end

  def lizard?
    @value == 'lizard'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

class Rock < Move
  def initialize
    @value = 'rock'
  end

  def >(other_move)
    other_move.scissors? || other_move.lizard?
  end

  def <(other_move)
    other_move.paper? || other_move.spock?
  end

  def to_s
    @value
  end
end

class Paper < Move
  def initialize
    @value = 'paper'
  end

  def >(other_move)
    other_move.rock? || other_move.spock?
  end

  def <(other_move)
    other_move.lizard? || other_move.scissors?
  end

  def to_s
    @value
  end
end

class Scissors < Move
  def initialize
    @value = 'scissors'
  end

  def >(other_move)
    other_move.paper? || other_move.lizard?
  end

  def <(other_move)
    other_move.rock? || other_move.spock?
  end

  def to_s
    @value
  end
end

class Spock < Move
  def initialize
    @value = 'spock'
  end

  def >(other_move)
    other_move.scissors? || other_move.rock?
  end

  def <(other_move)
    other_move.lizard? || other_move.paper?
  end

  def to_s
    @value
  end
end

class Lizard < Move
  def initialize
    @value = 'lizard'
  end

  def >(other_move)
    other_move.spock? || other_move.paper?
  end

  def <(other_move)
    other_move.rock? || other_move.scissors?
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :wins, :ties, :grand_wins

  def initialize
    set_name
    @wins = 0
    @ties = 0
    @grand_wins = 0
  end

  def create_move(choice)
    case choice
    when 'rock' then Rock.new
    when 'paper' then Paper.new
    when 'scissors' then Scissors.new
    when 'spock' then Spock.new
    when 'lizard' then Lizard.new
    end
  end

  def won
    self.wins += 1
  end

  def tied
    self.ties += 1
  end

  def grand_winner
    self.grand_wins += 1
  end
end

class Human < Player
  def set_name
    n = ''
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end
    self.move = create_move(choice)
  end
end

class Computer < Player
  attr_accessor :ai

  PERSONALITIES = { 'R2D2' => [50, 70, 80, 90, 100],
                    'Hal' => [2, 4, 40, 50, 100],
                    'Chappie' => [20, 30, 40, 90, 100],
                    'Sonny' => [10, 28, 30, 80, 100],
                    'Number 5' => [20, 70, 80, 90, 100] }

  def initialize
    super
    @ai = PERSONALITIES[name]
  end

  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    d100_roll = (1..100).to_a.sample
    ai.each_with_index do |range_max, index|
      if d100_roll <= range_max
        self.move = create_move(Move::VALUES[index])
        break
      end
    end
  end
end

class History
  attr_reader :human, :computer
  attr_accessor :moves, :current_match, :previous_matches

  def initialize(human, computer)
    @current_match = 1
    @previous_matches = []
    @moves = []
    @human = human
    @computer = computer
  end

  def add_moves(human_move, computer_move)
    @moves << [human_move, computer_move]
  end

  def update
    self.current_match += 1
    previous_matches << @moves
    self.moves = []
  end

  def show_match(round = @moves)
    hname = human.name
    cname = computer.name
    round.each_with_index do |move, index|
      puts "#{index + 1}: #{hname} #{move[0]} vs. #{cname} #{move[1]}"
    end
  end

  def show_history
    hname = human.name
    cname = computer.name
    puts "#{hname}: #{human.grand_wins} vs. #{cname}: #{computer.grand_wins}"
    puts ""
    previous_matches.each_with_index do |round, index|
      puts "***Round #{index + 1}***"
      show_match(round)
      puts ""
    end
  end
end

class RPSGame
  attr_accessor :human, :computer, :history

  PLAY_TO = 2

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history = History.new(human, computer)
  end

  def display_welcome_message
    clear_screen
    puts "Welcome to Rock, Paper, Scissors, lizard, Spock #{human.name}!"
  end

  def display_goodbye_message
    clear_screen
    history.show_history
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end

  def display_moves
    history.add_moves(human.move, computer.move)
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def update_winner(winner)
    winner.won
    puts "#{winner.name} won!"
  end

  def update_tie(human, computer)
    human.tied
    computer.tied
    puts "It's a tie!"
  end

  def display_winner
    if human.move > computer.move
      update_winner(human)
    elsif human.move < computer.move
      update_winner(computer)
    else
      update_tie(human, computer)
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n."
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def grand_winner?
    (human.wins >= PLAY_TO) || (computer.wins >= PLAY_TO)
  end

  def grand_winner_name
    if human.wins >= PLAY_TO
      human.grand_winner
      human.name
    else
      computer.grand_winner
      computer.name
    end
  end

  def display_grand_winner
    history.show_match
    history.update
    display_score
    puts "#{grand_winner_name} is the Grand Winner!"
  end

  def display_score
    puts "#{human.name}: #{human.wins} vs. #{computer.name}: #{computer.wins}"
  end

  def clear_screen
    system('clear') || system('cls')
  end

  def continue
    puts "Hit any key to continue"
    gets.chomp
  end

  def clear_scores
    human.wins = 0
    human.ties = 0
    computer.wins = 0
    computer.ties = 0
  end

  def new_round
    clear_scores
    clear_screen
  end

  def game_round
    display_score
    human.choose
    computer.choose
    clear_screen
    display_moves
    display_winner
    continue
    clear_screen
  end

  def play
    display_welcome_message
    loop do
      until grand_winner?
        game_round
      end
      display_grand_winner
      break unless play_again?
      new_round
    end
    display_goodbye_message
  end
end

RPSGame.new.play
