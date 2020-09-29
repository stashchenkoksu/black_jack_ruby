class Comunication
	INTRODUCTION = 'Hello dear player! \n Welcome to the Black Jack game. \n Please, enter your name below.'.freeze
	CARDS = '---Your cards---'.freeze
	SCORE = '---Your score---'.freeze
	CHOOSE_ACTION = 'Please, choose action'.freeze
	
	def self.set_player_name
		puts INTRODUCTION
		gets.chomp
	end

	def self.show_player_cards(player)
		puts 
		puts CARDS
		puts player.show_cards.join(' ')
		puts SCORE
		puts player.points
	end

	def self.actions(actions)
		puts CHOOSE_ACTION
		actions.each.with_index{ |action, index| puts "#{index + 1} #{action}" }
		choice = STDIN.gets.chomp.to_i - 1
	end

	 def clear_screen
	    Gem.win_platform? ? (system 'cls') : (system 'clear')
	 end
end