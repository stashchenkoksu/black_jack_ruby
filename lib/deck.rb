require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    cards = Card::RANKS.product(Card::SUITS)
    @cards = cards.map do |ranck, suit|
      Card.new(ranck, suit)
    end
  end

  def take_card
    card = cards.sample
    cards.delete(card)
    card
  end
end
