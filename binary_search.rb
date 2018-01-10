def binary_search(array, val)
  min = 0
  max = array.length - 1


  while min <= max do
    midpoint = (min + max) / 2

    if array[midpoint] == val
      return array[midpoint]
    elsif array[midpoint] > val
      max = midpoint - 1
    elsif array[midpoint] < val
      min = midpoint + 1
    end
  end
end


#recursive
def rec_bin_search(array, val)
  min = 0
  max = array.length - 1

  if array.length <= 0
    return nil
  end

  midpoint = (min + max)/2

  if array[midpoint] == val
    return array[midpoint]
  elsif array[midpoint] > val
    max = midpoint - 1
    return rec_bin_search(array[min..max], val)
  elsif array[midpoint] < val
    min = midpoint + 1
   return rec_bin_search(array[min..max], val)
  end
end

p rec_bin_search([1,2,3,4,5,6,7,8,9,10], 3)
