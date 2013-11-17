# Tic Tac Toe game defs
def check_rows(array)
    #REPLACE THIS CODE WITH YOUR METHOD
    i = 0
    until i > 8 do
        if (array[i] != 0 and array[i] == array[i+1] and array[i] == array[i+2])    
            return array[i]
        end
        i+=3
    end
    return 0
end
    
def check_columns(array)
    #REPLACE THIS CODE WITH YOUR METHOD
    i = 0
    until i > 3 do
        if (array[i] != 0 and array[i] == array[i+3] and array[i] == array[i+6])    
            return array[i]
        end
        i+=1
    end
    return 0
end

def check_diagonals(array)
	#REPLACE THIS CODE WITH YOUR METHOD
    if (array[0] != 0 and array[0] == array[4] and array[0] == array[8])    
        return array[0]
    end
    if (array[2] != 0 and array[2] == array[4] and array[2] == array[6])      
        return array[2]
    end
    return 0
end

def get_first_empty_move(array)
	#REPLACE THIS CODE WITH YOUR METHOD
    for i in 0..8
        if(array[i] == 0)
            return i
        end
    end
    return -1
end    