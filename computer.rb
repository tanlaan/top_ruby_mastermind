def computer_guess
    sleep(0.5)
    computer_secret
end

def computer_secret
    secret = ''
    4.times do 
        secret += (rand(6)+1).to_s
    end
    return secret
end