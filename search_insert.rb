def search_insert(array, val)
  min = 0
  max = array.length - 1

  if val > array[-1]
      return array.length
  end
  if val < array[0]
      return 0
  end

  while min <= max do
    midpoint = (min + max) / 2

    if array[midpoint] == val
      return midpoint
    elsif array[midpoint] > val
      if array[midpoint - 1] < val
        return midpoint
      end
      max = midpoint - 1
    elsif array[midpoint] < val
      if array[midpoint + 1] > val
        return midpoint + 1
      end
      min = midpoint + 1
    end
  end
end
