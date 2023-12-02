result = 0

File.foreach("input.txt") do |line|
  # parse game number
  game_num = line.split("Game ").last.split(":").first

  # check for valid cube counts
  # 12 red, 13 green, 14 blue

  draws = line.split(": ").last.split("; ")
  cubes = Hash.new

  draws.each do | draw |
    draw.split(", ").each do | cube |
      count, color = cube.split(" ")
      cubes[color] = count.to_i if cubes[color].nil? || count.to_i > cubes[color]
    end
    
    

  end

  p cubes

  if (cubes["red"] <= 12 && cubes["green"] <= 13 && cubes["blue"] <= 14)
    p "Game #{game_num} added"
    result += game_num.to_i
    p result
  else
    p "Game #{game_num} skipped"
  end
end

p result