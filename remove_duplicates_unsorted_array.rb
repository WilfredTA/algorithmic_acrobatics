# Delete duplicates in unsorted array in O(N) time with O(N) space
# Reader/writer:
# Increment writer and reader together if num has not yet appeared AND cache number
# When num has not been visited, write el at reader to el at writer
# when num has been visited, increment reader to the next value
# Writer should end at the last unique element, so pop all elements after index of writer

def remove_dupes(nums)
  cache = {}
  reader = 0
  writer = 0
  
  while reader < nums.length do
    if !cache[nums[reader]]
      cache[nums[reader]] = true
      nums[writer] = nums[reader]
      writer += 1
      reader += 1
    else
      reader += 1
    end
  end
  
  while writer < nums.length do
    nums.pop
  end
  nums
end

p remove_dupes([5,5,5,5,5]) # [5]
p remove_dupes([5,5,5,4,8,9,9,4,10,1])#[5,4,8,9,10,1]
p remove_dupes([1,2,3,4,5,5,5,6]) #[1,2,3,4,5,6]
p remove_dupes([1])# [1]