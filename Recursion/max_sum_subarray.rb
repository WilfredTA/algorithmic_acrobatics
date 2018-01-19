# Problem source: https://leetcode.com/problems/word-break/description/
# Find the maximum Subarray
# Start with length of 1 and check every subarray with length of 1 and store its max value. Then length of 2, if any subarray sum > current-max, reassign max. Do this up to subarray of length array.length

def max_sum(array)
  max_sum_helper(array, 1, -1.0/0.0)
end


def max_sum_helper(array, current_length, max)
  if array.length == 1
    return array[0]
  end
  if array.length < 1
    return 0
  end
  if current_length > array.length
    return max
  end
  
  start_pointer = 0
  end_pointer = current_length - 1
  
  while end_pointer < array.length do
    sum = array[start_pointer..end_pointer].reduce(:+)
    if sum >= max
      max = sum
    end
    start_pointer += 1
    end_pointer += 1
  end
  max_sum_helper(array, current_length + 1, max)
end


p max_sum([-2,1,-3,4,-1,2,1,-5,4]) # 6
