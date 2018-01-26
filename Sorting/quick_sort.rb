# Algorithm
# Partition
  # pivot := rightmost
  # right pointe := 2nd rightmost
  # left pointer := leftmost
  # loop
    # while val at left <= pivot increment left pointer (make sure left pointer never hits pivot index)
    # while val at right > pivot, increment right pointer
    # if left > right
      # swap left and pivot
      # break
    #else
      #swap left and right vals
  # end


def partition(array, left, right)
  pivot = right
  right -= 1
  puts "left: #{left}, right: #{right}"
  while true do
    while array[left] <= array[pivot] && left < pivot do
      left += 1
    end

    while array[right] > array[pivot] do
      right -= 1
    end



    if left >= right
      temp = array[left]
      array[left] = array[pivot]
      array[pivot] = temp
      break
    else
      temp = array[left]
      array[left] = array[right]
      array[right] = temp
    end
  end


 left
end

ary = [0,5,2,3,1,6,3] # [0,1,2,3,6,5] if partition is correct
#p partition(ary, 0, 5)



def quicksort(array, left, right)
  if right - left <= 0
    return
  end

  pivot = partition(array,left, right)
  quicksort(array, left, pivot - 1)
  quicksort(array, pivot+1, right)

  array
end



p quicksort(ary, 0, ary.length - 1)

# Algorithm Analysis:

# Assuming the partition divides the array roughly in half each time, then the
# Array will be divided in half log N times.
# But every element in each half is checked on each level. So, for each division,
# we check N elements. Since there are log N divisions, we do a total of N log N steps
# O(n log n) where n = number of elements in the array
