def search_range(nums, val)
  first = binary_search_first(nums, val)
  last = binary_search_last(nums, val)

  [first || -1, last || -1]
end

def binary_search_first(array, val)
  min = 0
  max = array.length - 1


  while min <= max do
    midpoint = (min + max) / 2
    if array[midpoint] == val
      first_occurrence = midpoint
      max = midpoint - 1
    elsif array[midpoint] > val
      max = midpoint - 1
    elsif array[midpoint] < val
      min = midpoint + 1
    end
  end
  first_occurrence
end

def binary_search_last(array, val)
  min = 0
  max = array.length - 1


  while min <= max do
    midpoint = (min + max) / 2
    if array[midpoint] == val
      last_occurrence = midpoint
      min = midpoint + 1
    elsif array[midpoint] > val
      max = midpoint - 1
    elsif array[midpoint] < val
      min = midpoint + 1
    end
  end
  last_occurrence
end
