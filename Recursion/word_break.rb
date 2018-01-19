# Problem Source: https://leetcode.com/problems/word-break/description/

def word_break(string, word_dict)
   return true if word_dict.include?(string)

  word_dict.each do |word|
    if string.start_with?(word)
      substring = string[word.length.. string.length-1]
      if word_break(substring, word_dict)
        return true
      end
    end
  end
  return false
end



dict = ['h', 'e', 'l', 'o']
p word_break("hello", dict)
