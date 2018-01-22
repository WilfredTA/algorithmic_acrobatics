
# Problem source: https://leetcode.com/problems/triangle/description/
#Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.



#1. Ask a generic question that can be used to solve the problem:

# What is the minimum path to the bottom from some coordinate C tri[row][col]?

# If we know this, we can define the solution to the problem as one specific instance of this more general solution where the coordinate C is tri[0][0]

# The minimum path sum from tri[row][col] to bottom is the sum of tri[row][col] + min{(row+1, col), (row+1, col+1)}

# Base case: The minimum path sum from any bottom element is the bottom element's value itself. So: if row == tri.length - 1, return tri[row][col]


def minimum_total(triangle)
  tri_helper(triangle, 0, 0)
end

def tri_helper(triangle, row, col, cache={})
  if row == triangle.length - 1
    return triangle[row][col]
  end
  
  path1 = cache[[row + 1,col]] || tri_helper(triangle, row+1, col, cache)
  path2 = cache[[row+1, col+1]] || tri_helper(triangle, row+1, col+1, cache)
  
  cache[[row,col]] = triangle[row][col] + [path1,path2].min
end

p minimum_total([
     [2],
    [3,4],
   [6,5,7],
  [4,1,8,3]
])
