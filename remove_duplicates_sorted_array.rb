# Remove duplicates from sorted array and return the length of the array with all unique values:


# Solution 1: O(N^2) runtime, O(1) space
# Two pointers. If both match delete one. Else, increment them.

def remove_duplicates(nums)
    reader = 1
    writer = 0
  
  while reader < nums.length do 
    if nums[reader] == nums[writer]
      nums.delete_at(reader)
    else
      reader += 1
      writer += 1
    end
  end
  nums.length
end


# Solution 2: O(N) runtime, O(1) space
# Reader/writer
# Whenever reader is not writer, increment writer and write the value of reader to writer (same as moving zeroes)

def remove_duplicates(nums)
  return 0 if nums.length == 0
    reader = 1
    writer = 0
  
  while reader < nums.length do 
    if nums[reader] != nums[writer]
      writer += 1
      nums[writer] = nums[reader]
    end
    reader += 1
  end
  
 
  writer + 1
end