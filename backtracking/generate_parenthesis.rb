# Problem Source https://leetcode.com/problems/generate-parentheses/description/

def generate_parenthesis(n)
    result = []
    parens(n, '', result, 0, 0)
    result
end


def parens(max, current, result, open, close)
  if current.length == max*2
    result << current
  else
    if open < max
      parens(max, current + "(", result, open + 1, close)
    end

    if close < open
      parens(max, current + ")", result, open, close + 1)
    end
  end
end

p generate_parenthesis(3)
