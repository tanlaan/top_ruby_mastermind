def get_user_guess
    valid_guess = false
    repeat = false
    guess = ''
    until valid_guess
        if repeat
            puts 'Remember, 4 slots and 1-6 as possible choices.'
        end
        print '>'
        guess = gets.chomp
        valid_guess = valid_user_guess(guess)
        repeat = true
    end
    return guess
end

def valid_user_guess(guess)
    # Length of 4
    return false if guess.length != 4

    # Characters 1-6
    for character in guess.split('')
        if character.to_i < 1 || character.to_i > 6
            return false
        end
    end
    return true
end