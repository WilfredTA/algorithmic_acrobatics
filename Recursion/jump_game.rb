# Problem Source: https://leetcode.com/problems/jump-game/description/

def can_jump(array)
  can_jump_helper(array, array.length - 1)
end

def can_jump_helper(array, last_idx)
  return true if last_idx == 0

  (0..last_idx-1).each do |idx|
    if array[idx] >= last_idx - idx
      if can_jump_helper(array, idx)
        return true
      end
    end
  end
  return false
end

p can_jump([1,1,1,2,0,3])



# Explanation
