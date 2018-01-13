# In both solutions, a similar pattern is used: Increment the writer and write in the reader, thereby building a new array as we iterate over it by inserting values only when those values pass a test.

# In move zeroes, whenever a NON-zero is encountered by reader, we can write that into the place of writer and then increment writer. Since writer starts at the beginning, we are building in all nonzero elements first

#In remove duplicates, we increment writer whenever a NON-same value is encountered by reader.

# Only increment writer and insert when reader encounters what you are aiming to keep. E.g., in move zeroes, we are manipulating the zeroes but keeping the other elements the same, so we increment writer and insert whenever we encounter the NON-zeroes

# In remove duplicates, we are aiming to keep non-duplicates. Therefore, whenever our reader encounters a NON-duplicate to the adjacent element, we increment writer and write in the non-duplicate.

# How to recognize when this pattern should be used:
# When the array needs to be mutated in place and the manipulations can be split into two phases: building up the first part of the array (e.g., unique values or non zeroes) and then cleaning up the second part (e.g., deleting the remaining duplicates or transforming the rest of the elements into zeroes)
# 
def move_zeroes(nums)
  count = 0
  reader = 0 #Can start on same index since they are checking against a value
  
  while reader < nums.length do
    if nums[reader] != 0
      nums[count] = nums[reader]
      count += 1
    end
    
    reader += 1
  end
  
  while count < nums.length do
    nums[count] = 0
    count += 1
  end
  nums
end

def remove_duplicates(nums)
  return 0 if nums.length == 0
    reader = 1
    writer = 0 # Must start on diff indices since they are checking against adjacent values
  
  while reader < nums.length do 
    if nums[reader] != nums[writer]
      writer += 1
      nums[writer] = nums[reader]
    end
    reader += 1
  end
  
  while writer <= nums.length do
    nums.pop
    writer += 1
  end

  nums
end


p move_zeroes([1, 0,2,0,0,4])
p remove_duplicates([1,1,2,2,3,3])