# Problem source: https://leetcode.com/problems/valid-parentheses/description/


class Stack
  attr_reader :values
  def initialize
    @values = []
  end

  def push(val)
    @values << val
  end

  def pop
    @values.pop
  end

  def peek
    @values[-1]
  end
  def size
    @values.size
  end
end

def is_valid(string)
  return false if string.length % 2 != 0
  stack = Stack.new
  matches = {"}" => "{", "]" => "[", ")" => "("}
  i = 0

  while i < string.length do
    if string[i].match(/[\[\{\(]/)
      stack.push(string[i])
    else
      if stack.peek == matches[string[i]]
        stack.pop
      end
    end
      i += 1
  end
  stack.size == 0
end
