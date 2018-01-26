# Algorithm for quick select to find kth lowest value
# partition array and return the index of the pivot
# if the index of pivot < k
  # partition, the right half
  # otherwise partition the left half
# Assumption: kth lowest value is based off of a 0-index scheme such that a k value
# of 1 indicates second lowest value
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


def quick_select(array, left, right, k)
  if right - left <= 0
    return
  end

  pivot_position = partition(array, left, right)

  if pivot_position < k
    quick_select(array, pivot_position + 1, right, k)
  elsif pivot_position > k
    quick_select(array, left, pivot_position - 1, k)
  else
    return array[pivot_position]
  end
end


array = [0, 50, 30, 60, 10] #k of 1 == 10

p quick_select(array, 0, array.length - 1, 1)
