require_relative 'p05_hash_map'

def can_string_be_palindrome?(string) 
    char_counts = HashMap.new
    # O(n) where n is length of string
    string.each_char do |char|
        if char_counts.include?(char)
            char_counts.set(char, char_counts[char] + 1)
        else
            char_counts.set(char, 1)
        end
    end
    odd_number_chars = false
    # O(n) worst case also, should be less than n & return early but O(1/2n) is still essentially O(n)
    char_counts.each do |_, count|
        next if count % 2 == 0
        return false if odd_number_chars # ok to have 1 odd numbered char in middle, but no more
        odd_number_chars = true
    end
    true
end
