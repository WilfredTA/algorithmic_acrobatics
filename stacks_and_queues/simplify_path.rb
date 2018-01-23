# Problem source: https://leetcode.com/problems/simplify-path/description/

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

def simplify_path(string)
  stack = Stack.new
  string_arr = string.split('/')
  string_arr.each do |str|
    if str == "." || str == ''

    elsif str == ".."
      stack.pop
    else
      stack.push(str + "/")
    end
  end

  result = stack.values.unshift('/').join('')
  if result == '/' || result == ''
    return '/'
  else
    return result[0..-2]
  end
end


#p simplify_path("/a/./b/../../c/")
#p simplify_path("/home/")
#p simplify_path("///")
#p simplify_path("/..")
p simplify_path("/a/./b///../c/../././../d/..//../e/./f/./g/././//.//h///././/..///")
