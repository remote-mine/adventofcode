result = 0
grid = []

start_x = 0
start_y = 0

File.foreach("input.txt") do |line|
  sline = line.strip().split("")
  grid.append(sline)
  p sline
  has_start = line.index("S")
  if has_start
    start_x = has_start
    start_y = $. - 1 
  end
end

s_pipes = ["|", "7", "F"]
n_pipes = ["|", "J", "L"]
w_pipes = ["-", "J", "7"]
e_pipes = ["-", "L", "F"]

p [grid[start_y][start_x], [start_y, start_x]]

direction = nil
curr_x = start_x
curr_y = start_y

# check north for connected pipe
if start_y > 0 && s_pipes.include?(grid[curr_y - 1][curr_x])  
  direction = "N"
  curr_y = curr_y - 1
end

# check south for pipe
if start_y < grid.length - 1 && n_pipes.include?(grid[curr_y + 1][curr_x])
  direction = "S"
  curr_y = curr_y + 1
end

result += 1

p "------------------------------------------"
p [grid[curr_y][curr_x], [curr_y, curr_x], direction, result]

while grid[curr_y][curr_x] != "S"
  case grid[curr_y][curr_x]
  when "7"
    if direction == "E"
      direction = "S"
    else
      direction = "W"
    end    
  when "L"
    if direction == "S"
      direction = "E"
    else
      direction = "N"
    end
  when "J"
    if direction == "E"
      direction = "N"
    else
      direction = "W"
    end    
  when "F"
    if direction == "N"
      direction = "E"
    else
      direction = "S"
    end
  end
  
  case direction
  when "S"
    curr_y += 1
  when "N"
    curr_y -= 1
  when "E"
    curr_x += 1
  when "W"
    curr_x -= 1
  end

  result += 1

  p [grid[curr_y][curr_x], [curr_y, curr_x], direction, result]

  if result > 150
    # break
  end
end


p result / 2