/*
Given an array of integers that is
already sorted in ascending order, find two numbers such that
they add up to a specific target number.

The function twoSum should return indices of the two numbers such that
they add up to the target, where index1 must be less than index2.
Please note that your returned answers (both index1 and index2) are not zero-based.

You may assume that each input would have exactly one solution and
you may not use the same element twice.


Thoughts:
  Two-pointers
  Index 0 and last index
  if low_pointer + high+pointer < target, increment low_pointer
  else, decrement high_pointer
  Continue as long as low_pointer + high_pointer != target

  Return [low, hi]


O(N) run time and O(1) space 

*/


const two_sum = (numbers, target) => {
  let low = 0;
  let high = numbers.length - 1;

  while (numbers[low] + numbers[high] != target) {
    if (numbers[low] + numbers[high] < target) {
      low++
    } else {
      high--
    }
  }

  return [low+1, high+1]
}
