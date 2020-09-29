require_relative 'player'
require_relative 'deck'
require_relative 'comunication'

INITIAL_RATE = 10
DEALER_STOP_VALUE = 17

class Game
  attr_reader :player, :dealer, :actions, :deck, :finish, :interface

  def initialize(interface)
    @player = Player.new(interface.set_player_name, 100)
    @dealer = Player.new('Dealer', 100)
    @interface = interface
    @finish = false
    interface.clear_screen
  end

  def start
    while money?
      interface.clear_screen
      get_new_cards
      player.take_money(INITIAL_RATE)
      dealer.take_money(INITIAL_RATE)
      interface.show_player_cards(player)
      player_moove until finish
      break unless next_round?
    end
    new_game
  end

  def next_round?
    interface.play_again?
  end

  def new_game
    interface.restart? ? restart : exit
  end

  def get_new_cards
    self.deck = Deck.new
    self.actions = %i[take_card skip open_cards]
    self.finish = false
    player.clear_cards
    dealer.clear_cards
    add_card(player)
    add_card(player)
    add_card(dealer)
    add_card(dealer)
  end

  def add_card(player)
    player.add_card(deck.take_card)
  end

  def player_moove
    player_choice = interface.choose_actions(actions)
    actions.delete(player_choice)
    method(player_choice).call unless player_choice == :open_cards
    add_card(dealer) if dealer.points < DEALER_STOP_VALUE
    open_cards if %i[take_card open_cards].include?(player_choice)
  end

  def open_cards
    interface.show_player_cards(dealer)
    choise = winner_choise
    method(choise).call
  end

  def winner_choise
    self.finish = true
    return :tie if tie?
    return :dealer_win if player.points > 21
    return :player_win if dealer.points > 21
    return :player_win if player_win?

    :dealer_win
  end

  def tie?
    player.points == dealer.points || player.points > 21 && dealer.points > 21
  end

  def player_win?
    21 - player.points < 21 - dealer.points
  end

  def take_card
    add_card(player)
    interface.show_player_cards(player)
  end

  def skip; end

  def dealer_win
    interface.lose
    dealer.put_money(INITIAL_RATE * 2)
  end

  def player_win
    interface.win
    player.put_money(INITIAL_RATE * 2)
  end

  def tie
    interface.tie
    player.put_money(INITIAL_RATE)
    dealer.put_money(INITIAL_RATE)
  end

  def money?
    player.balance.zero? || dealer.balance.zero? ? false : true
   end

  def restart
    interface.clear_screen
    self.dealer = Player.new('dealer', 100)
    self.player = Player.new(interface.set_player_name, 100)
    start
  end

  private

  attr_writer :player, :dealer, :deck, :actions, :finish
end
