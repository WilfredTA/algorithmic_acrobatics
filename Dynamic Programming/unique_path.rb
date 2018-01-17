# Unique path
# Redefine the problem:
  # The max number of steps to get to any coordinate is the sum of
  # the max number of steps at coordinate above 1 and coordinate to the left 1
  # unique_path(m, n) = unique_path(m-1, n) + unique_path(m, n-1)

# most trivial solvable case (base case):
  # if m == 1 || n == 1, then there is only one unique path



def unique_path(m, n, cache = {})
  return 1 if m == 1 || n == 1
  if cache[[m, n]]
    return cache[[m,n]]
  end
  
  cache[[m,n]] = unique_path(m-1, n) + unique_path(m, n-1)
end