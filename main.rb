require_relative 'lib/deck'
require_relative 'lib/game'

game = Game.new(Comunication.new)
game.start
