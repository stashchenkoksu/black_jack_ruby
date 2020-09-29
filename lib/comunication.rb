class Comunication
  INTRODUCTION = 'Hello dear player! Welcome to the Black Jack game.  Please, enter your name below.'.freeze
  CARDS = '---cards---'.freeze
  SCORE = '---score---'.freeze
  CHOOSE_ACTION = 'Please, choose action'.freeze
  WIN = '---Congrats!!!--- ---You win---'.freeze
  LOSE = '---YOU LOSE---'.freeze
  TIE = '---TIE---'.freeze
  PLAY_AGAIN = 'Do you want to play another round? (1 : Yes, 0 : No)'.freeze
  RESTART_REQUEST = 'Do you want to play a new game? (1 : Yes, 0 : No)'.freeze

  def set_player_name
    puts INTRODUCTION
    gets.chomp
  end

  def show_player_cards(player)
    puts
    puts player.name.upcase
    puts player.account.money.to_s + '$'
    puts CARDS
    puts player.show_cards.join(' ')
    puts SCORE
    puts player.points
    puts
  end

  def choose_actions(actions)
    puts CHOOSE_ACTION
    actions.each.with_index { |action, index| puts "#{index + 1} #{action}" }
    choice = STDIN.gets.chomp.to_i - 1
    result = actions[choice]
    result || choose_action(actions)
  end

  def clear_screen
    Gem.win_platform? ? (system 'cls') : (system 'clear')
   end

  def win
    puts WIN
   end

  def lose
    puts LOSE
   end

  def tie
    puts TIE
   end

  def play_again?
    puts PLAY_AGAIN
    choise = STDIN.gets.chomp.to_i
    return true if choise == 1

    false
   end

  def restart?
    puts RESTART_REQUEST
    choise = STDIN.gets.chomp.to_i
    return true if choise == 1

    false
   end
end
