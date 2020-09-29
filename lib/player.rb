require_relative 'account.rb'

attr_reader :name, :cards, :points, :account

class Player
	def initialize(name, money)
		@name = name
		@account = Account.new(money)
		@cards = []
		@points = 0
	end

	def add_card(card)
	  cards << card
	  value = card.value == 11 && points > 11 ? 1 : card.value 
	  points += value
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