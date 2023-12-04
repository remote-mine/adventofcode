cards = []
winners = []
scratchcards = {}

File.foreach("input.txt") do |line|
  sline = line.strip().split(/[:|]/)
  winners.append(sline[1].strip().split(" "))
  cards.append(sline[2].strip().split(" "))
  scratchcards[$.] = 1
end

for row in 0...cards.length
  intersection = (winners[row] & cards[row])

  # increment card counts
  for x in 2..intersection.length + 1
    scratchcards[row + x] += scratchcards[row + 1]
  end
end

p scratchcards.values().reduce(:+)