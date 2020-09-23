class Card
	RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
	SUITS = %w[♠ ♥ ♣ ♦].freeze

	attr_reader :name, :points

	def initialize(rank, suit)
		@name = "#{rank}#{suit}"
		@points = points_for(rank)
	end

	def points_for(rank)
		return 11 if rank == "A"
		return 10 if rank == 'J'||'Q'||'K'
		rank.to_i
	end
end