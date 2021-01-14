class Board
  attr_reader :winning_moves

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagnols

  def initialize
    @squares = {}
    @winning_moves = []
    reset
  end

  def [](key)
    @squares[key]
  end

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def get_winning_square_marker(line)
    line_markers = get_line_markers(line)
    empty_square = line[line_markers.index(Square::INITIAL_MARKER)]
    marker = line_markers.select { |m| m != Square::INITIAL_MARKER }.first
    [empty_square, marker]
  end

  def update_winning_moves
    wins = []
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if two_identical_markers?(squares)
        wins << get_winning_square_marker(line)
      end
    end
    @winning_moves = wins
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "     |     |     ".center(28)
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}  ".center(28)
    puts "     |     |     ".center(28)
    puts "-----|-----|-----".center(28)
    puts "     |     |     ".center(28)
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}  ".center(28)
    puts "     |     |     ".center(28)
    puts "-----|-----|-----".center(28)
    puts "     |     |     ".center(28)
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}  ".center(28)
    puts "     |     |     ".center(28)
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def get_line_markers(line)
    @squares.values_at(*line).map(&:marker)
  end

  def two_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 2
    markers.min == markers.max
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER
  MAX_WINS = 5

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = @human.marker
    @human_wins = 0
    @computer_wins = 0
  end

  def play
    loop do
      clear
      display_welcome_message
      main_game
      display_grand_winner
      break unless play_again?
      reset
      reset_match
    end
    display_goodbye_message
  end

  private

  def main_game
    loop do
      display_board
      player_move
      update_score
      display_result
      break if grand_winner?
      player_ready?
      reset
      display_play_again_message
    end
  end

  def reset_match
    @human_wins = 0
    @computer_wins = 0
  end

  def display_grand_winner
    if @human_wins >= MAX_WINS
      puts "You are the Grand Winner!"
    else
      puts "The Computer is the Grand Winner!"
    end
  end

  def player_ready?
    puts "Hit enter to proceed to the next game!"
    gets.chomp
  end

  def grand_winner?
    @human_wins >= MAX_WINS || @computer_wins >= MAX_WINS
  end

  def update_score
    case board.winning_marker
    when HUMAN_MARKER
      @human_wins += 1
    when COMPUTER_MARKER
      @computer_wins += 1
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won? || board.full?

      clear_screen_and_display_board
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def display_score
    "#{human.marker}: #{@human_wins} vs." \
      " #{computer.marker}: #{@computer_wins}".center(28, '-')
  end

  def display_board
    puts "You're a #{human.marker}. Computer is a #{computer.marker}."
    puts ""
    puts display_score
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def joiner(unmarked_keys, punctuation = ', ', conjunction = ' or ')
    if unmarked_keys.size <= 2
      unmarked_keys.join(conjunction)
    else
      unmarked_keys[0...-2].join(punctuation) + punctuation +
        unmarked_keys[-2..-1].join(conjunction)
    end
  end

  def human_moves
    puts "Choose a square (#{joiner(board.unmarked_keys)}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def find_winning_move(marker)
    moves = board.winning_moves
    moves.each do |move|
      return move[0] if move[1] == marker
    end
    nil
  end

  def find_defensive_move(marker)
    moves = board.winning_moves
    moves.each do |move|
      return move[0] if move[1] == marker
    end
    nil
  end

  def play_middle_square
    board[5] = computer.marker
  end

  def play_winning_move
    board[find_winning_move(computer.marker)] = computer.marker
  end

  def play_defensive_move
    board[find_defensive_move(human.marker)] = computer.marker
  end

  def select_random_square
    board[board.unmarked_keys.sample] = computer.marker
  end

  def computer_moves
    if !find_winning_move(computer.marker).nil?
      play_winning_move
    elsif !find_defensive_move(human.marker).nil?
      play_defensive_move
    elsif board[5].marker == Square::INITIAL_MARKER
      play_middle_square
    else
      select_random_square
    end
  end

  def display_result
    clear_screen_and_display_board
    case board.winning_marker
    when HUMAN_MARKER
      puts "You won!"
    when COMPUTER_MARKER
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    @current_player = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def human_turn?
    @current_player == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_player = COMPUTER_MARKER
    else
      board.update_winning_moves
      computer_moves
      @current_player = HUMAN_MARKER
    end
  end
end

game = TTTGame.new
game.play
