
# Problem Source https://leetcode.com/problems/letter-combinations-of-a-phone-number/description/

def letter_combinations(digits)
    return [] if digits.empty?
    hash = {
    '0' => '',
    '1' => '',
    '2' => 'abc',
    '3' => 'def',
    '4' => 'ghi',
    '5' => 'jkl',
    '6' => 'mno',
    '7' => 'pqrs',
    '8' => 'tuv',
    '9' => 'wxyz'
  }
    length = digits.length
    letters = ''
    result = []

    digits = digits.split('').map do |digit|
       hash[digit].split('')

    end

    helper(digits, result, '', 0)
    result
end

def helper(digits_set, result, current_string, curr_pos)
  if current_string.length == digits_set.length
    result << current_string.clone
  else
    digits_set[curr_pos].each do |char|
      helper(digits_set, result, current_string + char, curr_pos + 1)
    end
  end
end
