result = 0

File.foreach("input.txt") do |line|
  # parse game number
  game_num = line.split("Game ").last.split(":").first

  draws = line.split(": ").last.split("; ")
  cubes = Hash.new

  draws.each do | draw |
    draw.split(", ").each do | cube |
      count, color = cube.split(" ")
      cubes[color] = count.to_i if cubes[color].nil? || count.to_i > cubes[color]
    end
  end

  p cubes
  
  power = cubes["red"] * cubes["green"] * cubes["blue"]
  p "Power: #{power}"
  
  result += power
end

p result