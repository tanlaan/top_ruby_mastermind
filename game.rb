require_relative './board.rb'
require_relative './game_logic.rb'
require_relative './tui.rb'

class Game
    attr_accessor :guess, :round

    def initialize(secret=nil)
        @gameboard = Board.new()
        # Get the secret from computer or player later
        @secret = secret || get_secret()
        
        @guess = ""
        @tries = 10
        @round = 1
        @winner = false
    end

    def start()
        until winner?
            # Print the current gameboard
            print @gameboard

            # Get the user's next guess
            @guess = get_user_guess()

            # Add our guess to the gameboard
            @gameboard.guesses += [@guess]

            # Figure out what our hints for
            # the last guess are
            @gameboard.hint = get_hint(@secret, @guess)

            # Increase our current round
            @round += 1
        end

        print @gameboard
        print "#{winner} wins!\n"
    end

    def winner
        return 'Player' if @guess == @secret
        return 'Computer' if @round > @tries
    end

    def winner?
        !!winner
    end
end