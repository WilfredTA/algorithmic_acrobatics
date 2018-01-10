def is_perfect_square(num)
  binary_search( num)

end

def binary_search(val)
  min = 0
  max = val
  square = false


  while min <= max do
    midpoint = (min + max) / 2

    if midpoint * midpoint == val
      return true
    elsif midpoint * midpoint > val
      max = midpoint - 1
    elsif midpoint * midpoint < val
      min = midpoint + 1
    end
  end
  square
end
p is_perfect_square(2147483647)
