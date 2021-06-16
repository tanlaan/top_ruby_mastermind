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

def human_secret
    puts "What's the secret?"
    get_user_guess
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
    get_answer?("Do you want to play again?")
end

def get_answer?(message)
    answer = ''
    until valid_answer?(answer)
        print message
        answer = gets.chomp.downcase
    end
    valid_true?(answer)
end

def valid_true?(word)
    truthy = ['yes', 'y']
    return truthy.include? word
end

def valid_false?(word)
    falsy = ['no', 'n']
    return falsy.include? word
end

def valid_answer?(word)
    return valid_true?(word) || valid_false?(word)
end

def welcome_message
    puts "Welcome to Mastermind the cipher solving game!"
    puts "The computer has chosen a 4 digit code for you to solve."
    puts "The digits are from 1-6. A guess with correct numbers"
    puts "in the correct place gets you a B. Correct numbers in the"
    puts "wrong place give you a W. You've got 10 tries! Have fun!"
end

def exit_message
    puts "Hope you had fun playing! See you next time!"
end

def get_game_type
    puts "Do you want to crack the code?"
    puts "Yes = Break code, No = Make secret"
    get_answer?(">") ? 'breaker' : 'maker'
end