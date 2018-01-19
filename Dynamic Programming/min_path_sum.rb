#Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.

#Note: You can only move either down or right at any point in time.

#Example 1:
#[[1,3,1],
# [1,5,1],
# [4,2,1]]
#Given the above grid map, return 7. Because the path 1→3→1→1→1 minimizes the sum.

# 1. Rephrase the problem as a general problem, then assume it is solved and
#    redefine the solution in terms of the solution to sub problems
# 2. Express the solutions of sub-problems with recursion:
      # A). Parameters and Return value
      # B). Reduction - How the sub-problems lead up to the general problem*
      # C). Base Case
      # D). Use the return value

# 3. Optimize with a cache
    # - Check the cache first before the recursive calls

# * This is usually the hardest part. There are certain things to look for in a
# problem description to help identify how the reduction should be. If you are
# supposed to find a minimum value (such as in this case), then the return value of the
# recursive calls will probably be compared and the lesser of the two will be used



# USING THE PROCESS
# STEP 1
# Assume we have reached the bottom right corner of the grid: which path
# is the one that we took to get there? We took the minimum path. Which path is the
# minimum path? Well, it is the current value added two the minimum of the path that
# terminates one cell above the bottom right, and the path that terminates one cell
# to the left of bottom right.

# So, min_path(x,y) is the lesser of the two paths that terminate at x-1, y and x, y-1
# The sum of min_path(x,y) is the val of x,y + the sum of those two paths.

# STEP 2
# The return value of min_path needs to be a sum
# The parameters will be the grid and the x and y value of the current cell




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
