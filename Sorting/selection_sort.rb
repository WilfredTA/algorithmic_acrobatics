# Algorithm
# Anchor/runner pointers
# start at first index with anchor and compare each val at runner to
# val at anchor
# store the minimum value seen and swap min val with anchor at the end of runner's passthrough
# Time complexity: O(N^2)
# Space complexity: O(1) -- sorting is done in place


def selection_sort(array)
 anchor = 0


  while anchor < array.length do
    runner = anchor + 1
    min = anchor
    while runner < array.length do
      if array[runner] < array[min]
        min = runner
      end
      runner += 1
    end
    if min != anchor
      array[anchor], array[min] = array[min], array[anchor]
    end
    anchor += 1
  end

  array
end


ary = [4,9,1,3,7]

p selection_sort(ary)
