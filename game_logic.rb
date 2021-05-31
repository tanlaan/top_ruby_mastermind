def get_hint(secret, guess)
    return [4,0] if secret == guess
    black = 0
    white = 0
    guess.split('').each_with_index do | g, i|

        matched = false
        secret.split('').each_with_index do | s, j |
            # White or Black peg
            if s == g
                # Black peg
                if j == i
                    if matched
                        white -= 1
                    end
                    black += 1
                    matched = true
                    
                # White peg
                else
                    unless matched
                        white += 1
                        matched = true
                    end
                end
            end
        end
    end

    return [black, white]
end