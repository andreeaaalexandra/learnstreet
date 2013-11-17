def generate_solution()
    # Create a random string with length 4 containing only values
    # from the letters "ROYGBV". Each of these letters will represent
    # the colors red, orange, yellow, green, blue, and violet.
    # WRITE YOUR CODE HERE
    colors = ["R","O","Y","G","B","V"]
    string = ""
    4.times do
        string += colors[rand(6)]
    end
    return string
end

def check_answer_match(currentGuess, answer)
    # This method will compare two sequences of input parameters
    # "currentGuess", the sequence of guesses, and "answer", which
    # is the correct solution sequence generated by the method you wrote
    # above (generate_solution).
    # This method should return the number of correct matches between the
    # two inputs, where a correct match is defined as the same character in
    # the same position in each of the two input strings.
    #WRITE YOUR CODE HERE
    
    correct = 0
    for i in 0...answer.length
        if currentGuess[i] == answer[i,1]
            correct += 1
        end
    end
    return correct
end

def check_answer_wrong_place(ans, realanswer)
    # This method compares two input strings representing a player's guess ("ans")
    # at the correct sequence of colored pegs and the actual correct solution
    # ("realanswer"). But instead of returning the correct number of positional
    # matches between the two strings, this method returns the number of
    # character matches between the two strings where the matching characters
    # are not in the same position in both strings hence "right answer, wrong place"
    #WRITE YOUR CODE HERE
    correct = 0
    tempAns = realanswer
    for i in 0...realanswer.length
        if ans[i,1] == realanswer[i,1]
            ans = ans[0, i] + "-" + ans[i + 1, ans.length]
            tempAns = tempAns[0, i] + "-" + tempAns[i + 1, tempAns.length]
        end
    end
    for i in 0...tempAns.length
        if ans[i,1] == "-"
            next
        end
        character = ans[i, 1]
        if tempAns.index(character) != nil
            correct += 1
        end
    end
    return correct
end