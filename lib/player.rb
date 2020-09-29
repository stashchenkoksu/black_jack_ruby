require_relative 'account.rb'

class Player
  attr_reader :name, :cards, :points, :account

  def initialize(name, money)
    @name = name
    @account = Account.new(money)
    @cards = []
    @points = 0
  end

  def add_card(card)
    cards << card
    self.points += card.points
    checking
  end

  def checking
    free_points = cards.select { |card| card.points == 11 }.count
    while points > 21 && free_points.positive?
      self.points -= 10
      free_points -= 1
  end
  end

  def show_cards
    cards.map(&:name)
   end

  def clear_cards
    @cards = []
    @points = 0
  end

  def take_money(money)
    account.take_money(money)
 end

  def put_money(money)
    account.put_money(money)
  end

  def balance
    account.money
  end

  private

  attr_writer :cards, :points
end
