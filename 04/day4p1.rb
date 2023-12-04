result = 0
cards = []
winners = []

File.foreach("input.txt") do |line|
  sline = line.strip().split(/[:|]/)
  winners.append(sline[1].strip().split(" "))
  cards.append(sline[2].strip().split(" "))
end

for row in 0...cards.length
  points = 0
  intersection = (winners[row] & cards[row]).length
  if intersection > 0
    points = 2.pow(intersection - 1)
  end

  result += points
end

p result