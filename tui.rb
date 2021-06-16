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
    'maker'
end