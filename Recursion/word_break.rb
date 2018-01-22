<<<<<<< HEAD
# Problem Source: https://leetcode.com/problems/word-break/description/

def word_break(string, word_dict)
   return true if word_dict.include?(string)

  word_dict.each do |word|
    if string.start_with?(word)
      substring = string[word.length.. string.length-1]
      if word_break(substring, word_dict)
=======
#problem source: https://leetcode.com/problems/word-break/description/

def word_break(string, dict)
  if dict.include?(string)
    return true
  end
  
  dict.each do |word|
    if string.start_with?(word)
      if word_break(string[word.length, string.length - 1], dict)
>>>>>>> e76d8a2a160a065a9a22d2cec24d38b849c58431
        return true
      end
    end
  end
  return false
<<<<<<< HEAD
end



dict = ['h', 'e', 'l', 'o']
p word_break("hello", dict)
=======
end
>>>>>>> e76d8a2a160a065a9a22d2cec24d38b849c58431
