result = 0
board = []

File.foreach("example.txt") do |line|
  board.append(line.strip())
end

for row in 0...board.length
  for col in 0...board.first.length
    char = board[row][col]
    # find symbol in this row
    next if char.match(/[0-9\.]/)

    p "#{row},#{col}: #{char}"
    temp = 0

    # check neighbors for numbers
    if col < board.first.length
      # right
      if board[row][col + 1].match(/[0-9]/)
        num = board[row][col + 1, 3].slice(/[0-9]+/).to_i
        p 'found right ' + num.to_s
        temp += num
      end

      # top right
      if row > 0 && !board[row - 1][col].match(/[0-9]/) && board[row - 1][col + 1].match(/[0-9]/)
        num = board[row - 1][col + 1, 5].slice(/[0-9]+/).to_i
        p 'found top right ' + num.to_s
        temp += num
      end

      # bottom right
      if row < board.length - 1 && !board[row + 1][col].match(/[0-9]/) && board[row + 1][col + 1].match(/[0-9]/)
        num = board[row + 1][col + 1, 5].slice(/[0-9]+/).to_i
        p 'found bottom right ' + num.to_s
        temp += num
      end
    end

    if col > 0 
      # left
      if board[row][col - 1].match(/[0-9]/)
        num = board[row][0, col].reverse().slice(/[0-9]+/).reverse().to_i
        p 'found left ' + num.to_s
        temp += num 
      end

      # top left
      if row > 0 && !board[row - 1][col].match(/[0-9]/) && board[row - 1][col - 1].match(/[0-9]/)
        num = board[row - 1][0, col].reverse().slice(/[0-9]+/).reverse().to_i
        p 'found top left ' + num.to_s
        temp += num
      end

      # bottom left
      if row < board.length - 1 && !board[row + 1][col].match(/[0-9]/) && board[row + 1][col - 1].match(/[0-9]/)
        num = board[row + 1][0, col].reverse().slice(/[0-9]+/).reverse().to_i
        p 'found bottom left ' + num.to_s
        temp += num
      end
    end

    # check neighbors above
    if row > 0
      if board[row - 1][col].match(/[0-9]/)
        num = board[row - 1][col]
        x = col
        # go left and prepend
        while x > 0 && board[row - 1][x - 1].match(/[0-9]/)
          # p 'prepending'
          num.prepend(board[row - 1][x - 1])
          x -= 1
        end
        # go right and append
        x = col
        while x < board.length - 1 && board[row - 1][x + 1].match(/[0-9]/)
          # p 'appending'
          num.concat(board[row - 1][x + 1])
          x += 1
        end
        temp += num.to_i
        p "Found above number #{num}"
      end
    end

    # check neighbors below
    if row < board.length - 1
      if board[row + 1][col].match(/[0-9]/)
        num = board[row + 1][col]
        x = col
        # go left and prepend
        while x > 0 && board[row + 1][x - 1].match(/[0-9]/)
          # p 'prepending'
          num.prepend(board[row + 1][x - 1])
          x -= 1
        end
        # go right and append
        x = col
        while x < board.length - 1 && board[row + 1][x + 1].match(/[0-9]/)
          # p 'appending'
          num.concat(board[row + 1][x + 1])
          x += 1
        end
        temp += num.to_i
        p "Found below number #{num}"
      end
    end

    result += temp
  end 
end

p result