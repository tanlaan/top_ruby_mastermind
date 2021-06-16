require_relative './board.rb'
require_relative './game_logic.rb'
require_relative './tui.rb'
require_relative './computer.rb'

class Game
    attr_accessor :guess, :round

    def initialize(game_type)
        @gameboard = Board.new()
        @game_type = game_type || 'breaker'
        @maker   =   @game_type == 'maker'   ? 'Player' : 'Computer'
        @breaker =   @game_type == 'breaker' ? 'Player' : 'Computer'
        @secret = get_secret
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
            @guess = get_guess

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
        return @breaker if @guess == @secret
        return @maker if @round > @tries
    end

    def winner?
        !!winner
    end

    def get_secret
        return computer_secret if @game_type == 'breaker'
        human_secret
    end

    def get_guess
        return computer_guess if @game_type == 'maker'
        get_user_guess
    end
end