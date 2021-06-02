def get_hint(secret, guess)
    # The logic for this function fails
    # to account for a guess with multiple
    # matching numbers, more than appear
    # in the secret
    # e.g.
    # Guess = 1111 & Secret = 1234
    # returns [1,3] not [1,0]

    return [4,0] if secret == guess
    guesses = guess.split('')
    secrets = secret.split('')
    check_pegs(guesses, secrets)
end

def check_pegs(guesses, secrets)
    hints = Array.new(4)
    guesses.each_with_index do | g, i |
        if g == secrets[i]
            hints[i] = 'B'
        else
            secrets.each_with_index do | s, j |
                if g == s
                    if hints[j].nil?
                        hints[j] = 'W'
                        break
                    end
                end
            end
        end
    end
    peg_count(hints)
end

def peg_count(hints)
    pegs = Array.new(2, 0)
    hints.each do | hint |
        pegs[0] += 1 if hint == 'B'
        pegs[1] += 1 if hint == 'W'
    end
    return pegs
end

def get_secret
    secret = ''
    4.times do 
        secret += (rand(6)+1).to_s
    end
    return secret
end