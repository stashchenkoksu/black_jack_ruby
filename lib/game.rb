require_relative 'player'
require_relative 'deck'
require_relative 'comunication'

attr_reader :player, :dealer, :actions, :deck

class Game

	def initialize(interface)
		@player = Player.new(interface.set_player_name,100)
		@dealer = Player.new("Dealer",100)
		@interface = interface
		actions = [:take_card, :skip, :open_cards]
	end

	def start
		get_new_cards
		interface.show_player_cards(player)	
	end

	def get_new_cards
		self.deck = Deck.new
    	self.actions = [:take_card, :skip, :open_cards]
    	player.clear_cards
    	dealer.clear_cards
		player.add_card
		player.add_card
		dealer.add_card
		dealer.add_card
	end

end