#Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

#Note: You can only move either down or right at any point in time.

#Example 1:
#[[1,3,1],
# [1,5,1],
# [4,2,1]]
#Given the above grid map, return 7. Because the path 1→3→1→1→1 minimizes the sum.

def min_path_sum(grid)
  min_path_sum_helper(grid, grid.length - 1, grid[0].length - 1)
end


def min_path_sum_helper(grid, rows, cols, memo = {})
  if rows == 0 && cols == 0
    return grid[rows][cols]
  end
  if rows < 0 || cols < 0
    return Float::INFINITY
  end

  path1 = memo[[rows-1, cols]] || min_path_sum_helper(grid, rows-1, cols, memo)
  path2 = memo[[rows, cols-1]] || min_path_sum_helper(grid, rows, cols-1, memo)
  memo[[rows, cols]] = grid[rows][cols] + min(path1, path2)

end

def min(x, y)
  if x < y
    return x
  else
    return y
  end
end

p min_path_sum([[1,3,1],
 [1,5,1],
 [4,2,1]]) # 7
