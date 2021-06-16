require_relative './tui.rb'
require_relative './game.rb'
# We will run this in the command line
# Computer will choose 4 random digits
# Player will be presented with 'console'
#   for inputing guesses

playing = true
welcome_message()

while playing
    game_type = get_game_type
    game = Game.new(game_type)
    game.start
    playing = keep_playing?
end

exit_message()