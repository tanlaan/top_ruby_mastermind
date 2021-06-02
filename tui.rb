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

def keep_playing?
    valid_answer = false
    valid_true = ['yes', 'y']
    valid_false = ['no', 'n']
    valid_answers = valid_true + valid_false
    answer = ''
    until valid_answer
        print "Do you want to play again?"
        answer = gets.chomp.downcase
        valid_answer = true if valid_answers.include? answer
    end
    return true if valid_true.include? answer 
    return false if valid_false.include? answer
end