
=begin
mergesort
  Base case: Trivially solvable
    return array if array has one element
  
  
  Reduction: smaller version of the same problem 
    split array in two halves
    arr1 = mergesort(arr1)
    arr2 = margesort(arr2)

  Return value:
    merge(arr1, arr2)
=end

def merge_sort(arr)
  return arr if arr.length < 2
  
  arr1 = merge_sort(arr[0..arr.length/2 - 1]) #  [1,3,5]
  arr2 = merge_sort(arr[arr.length/2.. arr.length - 1]) #  [2,4,9]
  
  merge(arr1, arr2)
end

def merge(arr1, arr2)
  #p arr1 
  #p arr2
  #one central pointer, two sub pointers on each array
  # push the lesser of two into new array, return new array
  merged =[]
  i = 0
  j = 0
  k = 0 # new merged array index pointer
  
 

  while k < arr1.length + arr2.length do
    if arr1[i] < arr2[j]
      merged[k] = arr1[i]
      i += 1
    else
      merged[k] = arr2[j]
      j += 1
    end
    k += 1
    break if arr1[i].nil? || arr2[j].nil?
  end

  if arr1[i]
    merged = merged.concat(arr1[i..arr1.length - 1])
  end
  if arr2[j]
   merged = merged.concat(arr2[j..arr2.length - 1])
  end
  merged
end

p merge_sort([1,3,5,2,4,9]) # [1,2,3,4,5,9]
p merge_sort([7,3,5,0,1,3,6])
# p merge([1,3,5],[2,4,9]) # [1,2,3,4,5,9]