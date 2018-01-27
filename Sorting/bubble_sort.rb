# Two pointer slide
# swap vals at pointers if val at pointer 1 > val at pointer 2
# largest value therefore bubbles to the top on each passthrough

def bubble_sort(array)
  limit = array.length - 1


  while limit >= 0 do
    pointer1 = 0
    pointer2 = 1
    while pointer2 <= limit do
      if array[pointer1] > array[pointer2]
        array[pointer1], array[pointer2] = array[pointer2], array[pointer1]
      end
      pointer1 += 1
      pointer2 += 1
    end
    limit -= 1
  end

  array
end


ary = [7,6,5,3,2]
ary2 = [1,3,8,7,6,4,2]

p bubble_sort(ary)
p bubble_sort(ary2)
