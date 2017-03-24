# 1.1 Is Unique - pg 90
# O(n) time, O(1) space
def is_unique(string)
  letters = Hash.new(0)
  string.each_char { |letter| letters[letter] += 1 }
  letters.none? { |letter, count| count > 1 }
end

# O(n^2) time, O(1) space
def is_unique_no_additional_data_structures(string)
  (0...string.length).each do |i|
    (i + 1...string.length).each do |j|
      return false if string[i] == string[j]
    end
  end

  true
end
