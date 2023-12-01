WORDS_TO_REPLACE = {
  'one' => '1',
  'two' => '2',
  'three' => '3',
  'four' => '4',
  'five' => '5',
  'six' => '6',
  'seven' => '7',
  'eight' => '8',
  'nine' => '9'
}

def self.get_word_with_lowest_index(line)
  index = line.length
  subword = nil
  subnum = nil

  WORDS_TO_REPLACE.each do |word, replacement|
    temp = line.index(word)
    if temp && temp < index
      subword = word
      subnum = replacement + word[-1] # ugly hack for twone, eightwo
      index = temp
    end
  end

  [subword, subnum]
end

def self.get_word_with_highest_index(line)
  index = -1
  subword = nil
  subnum = nil

  WORDS_TO_REPLACE.each do |word, replacement|
    temp = line.rindex(word)
    if temp && temp > index
      subword = word
      subnum = replacement
      index = temp
    end
  end

  [subword, subnum]
end

result = 0

File.foreach("input.txt") do |line|
  val1 = 0
  val2 = 0

  oline = line.dup

  # replace only the first text number
  subword, subnum = get_word_with_lowest_index(line)
  line.gsub!(subword, subnum) if subword

  # replace everything that matches the last text number
  subword, subnum = get_word_with_highest_index(line)
  line.gsub!(subword, subnum) if subword

  # puts "oline: " + oline
  # puts " line: " + line

  line.each_char do |c|
    if c.match(/[0-9]/)
      val1 = c.to_i * 10 if val1 == 0
      val2 = c.to_i
    end
  end

  result += val1 + val2
  # puts val1 + val2
  # puts " " + result.to_s
end

p result