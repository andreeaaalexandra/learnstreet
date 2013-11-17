# Connect Four
def init_matrix()
    # Initialize the matrix with a two-dimensional array,
    # with 6 rows and 7 columns, setting all values to 0.
    #REPLACE THIS CODE WITH YOUR init_matrix METHOD
    matrix =  []
    for i in 0...6
        row = []
        for j in 0...7
            row.push(0)
        end
        matrix.push(row)
    end
    return matrix
end
    
def get_drop_position(matrix, columnPosition)
    # This method returns the position of row (i.e., cell's row position)
    # Find the blank cell {i.e., for value 0} from row 5 to 0.
    # If there is no blank cell in that column return -1.
    #REPLACE THIS CODE WITH YOUR get_drop_position METHOD
    for i in 5.downto(0)
        if matrix[i][columnPosition] == 0
            return i
        end
    end
    return -1
end
    
def set_drop_value(matrix, rowPosition, columnPosition, human)
    # This method returns a matrix with values,
    # value 1 if human is true otherwise value 2
    #REPLACE THIS CODE WITH YOUR set_drop_value METHOD
    if human
        matrix[rowPosition][columnPosition] = 1
    else
        matrix[rowPosition][columnPosition] = 2
    end
    return matrix
end

def get_row_win(matrix)
    # set 4 [i,j] values to a default cell position say -1 in a list.
    # [[-1,-1][-1,-1][-1,-1][-1,-1]]
    # For each row, check if any 4 consecutive similar values are there,
    # if so return the positions as a list [[row1, col1],[row2, col2],[row3, col3],[row4, col4]].
    #REPLACE THIS CODE WITH YOUR get_row_win METHOD
    wins = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]]
    for row in 5.downto(0)
        for col in 0..3
            if matrix[row][col] != 0
                val = matrix[row][col]
                if matrix[row][col + 1] == val && matrix[row][col + 2] == val && matrix[row][col + 3] == val
                    wins = [[row, col], [row, col + 1], [row, col + 2], [row, col + 3]]
                    return wins
                end
            end
        end
    end
    return wins
end
    
def get_column_win(matrix)
    # Similarly, set 4 [i,j] default values in a list, for each column,
    # check for any 4 consecutive cells with same values and then return
    # their positions in the list.
    #REPLACE THIS CODE WITH YOUR get_column_win METHOD
    wins = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]]
    for col in 0...6
        for row in 5.downto(3)
            if matrix[row][col] != 0
                val = matrix[row][col]
                 if matrix[row-1][col] == val && matrix[row-2][col] == val && matrix[row-3][col] == val
                    wins = [[row, col], [row-1, col], [row-2, col], [row-3, col]]
                    return wins
                end
            end
        end
    end
    return wins
end
    
def get_diagonal_left_to_right_win(matrix)
    # Similarly, set 4 [i,j] default values in a list.
    # Starting from left corner for each diagonal going right up check for 4 consecutive cells
    # with same values and return their positions.
    #REPLACE THIS CODE WITH YOUR get_diagonal_left_to_right_win METHOD
    wins = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]]
    for row in 5.downto(3)
        for col in 0..3
            if matrix[row][col] != 0
                val = matrix[row][col]
                if matrix[row-1][col+1] == val && matrix[row-2][col+2] == val && matrix[row-3][col+3] == val
                    wins = [[row, col], [row-1, col+1], [row-2, col+2], [row-3, col+3]]
                    return wins
                end
            end
        end
    end
    return wins
end
    
def get_diagonal_right_to_left_win(matrix)
    # Similarly, set 4 [i,j] default values in a list.
    # Starting from right corner for each diagonal going left up check for 4 consecutive cells
    # with same values and return their positions.
    #REPLACE THIS CODE WITH YOUR get_diagonal_right_to_left_win METHOD
    wins = [[-1, -1], [-1, -1], [-1, -1], [-1, -1]]
    for row in 5.downto(3)
        for col in 6.downto(3)
            if matrix[row][col] != 0
                val = matrix[row][col]
                if matrix[row-1][col-1] == val && matrix[row-2][col-2] == val && matrix[row-3][col-3] == val
                    wins = [[row, col], [row-1, col-1], [row-2, col-2], [row-3, col-3]]
                    return wins
                end
            end
        end
    end
    return wins
end
    
def is_game_over(matrix)
    # If the entire matrix is filled and there are no winners then the Game is Over.
    #REPLACE THIS CODE WITH YOUR is_game_over METHOD
    for i in 0...matrix.length
        for j in 0...matrix[i].length
            if matrix[i][j] == 0
                return false
            end
        end
    end
    return true
end