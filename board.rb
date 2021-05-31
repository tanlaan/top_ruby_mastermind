class Board
    attr_accessor :secret, :guesses, :hint

    def initialize()
        @guesses = []
        @hint = [0,0]
    end

    def to_s
        board = ""

        # Top of box
        board += "  _0_1_2_3_ \n"

        # Guesses "1| 2 3 4 5 |\n" 
        @guesses.each_with_index do | guess, index |
            board += "#{index}| %d %d %d %d |\n" % guess.split('')
        end

        # Bottom of box
        board += " |---------|\n" 

        # Hints  " |  1B 0W  |\n"
        board += " |  %dB %dW  |\n" % @hint

    end

end