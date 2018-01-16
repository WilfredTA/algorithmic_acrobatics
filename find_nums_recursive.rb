# Find a number in an array and return its index. If it is not found, return negative 1


def find_num(num, nums)
  find_num_helper(num, nums, 0)
end

def find_num_helper(num, nums, current_idx)
  if nums[current_idx] == num
    return current_idx
  end
  
  if current_idx == nums.length - 1
    return -1
  end
  find_num_helper(num, nums, current_idx + 1)
end



p find_num(2, [1,3,4,5,6,2,8])