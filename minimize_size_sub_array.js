/*
Given an array of n positive integers and a positive integer s, find the minimal
length of a contiguous subarray of which the sum ≥ s.
If there isn't one, return 0 instead.

For example, given the array [2,3,1,2,4,3] and s = 7,
the subarray [4,3] has the minimal length under the problem constraint.


O(N) runtime and O(1) space

Naive brute force algorithm:
  Set k = 1
  set window = length k beginning at start of array (start to k)
  Iterate through array, summing the values within window
  If sum == target, return the length of window
  If k == end of array, increment k and repeat
  break if k > length of array


Two Pointers Algorithm
  For each element `i` in array, set sum += i
    If sum is larger than target value, then set j = 0
    Remove the value of array[j] from sum as long as sum is larget than target value
    Increment j
    If sum is equal to target value, return the difference between index i and j


    Why it works:
      Every time we add an element to sum, we check if sum is now greater than the target value
      If it is, we know that the current set of elements that was used to compute sum is too large, so we
      iterate from the beginning of array, subtracting each value until sum is no longer larger than target value.
      Whenever this happens, we then check if sum is equivalent to target value (since we now know it is, at the very least,
      not larger than target value). If it is, then we can store the current start and end indices since they are the shortest
      range thus far. We then continue this process until we have touched every element in the array.

      Why it's O(N)
        The outer loop touches every number in the array, giving it an O(N) runtime.
        In a worst case scenario, the internal while loop is also O(N), hitting every number once.
        So, in a worst case scenario we observe 2N operations on an array with N cells, which simplifies to O(N)

*/

const minSubArrayLen = (s, nums) => {
  const max = nums.length;
  let sum = 0;
  let j = 0;
  var start=0;
  var end=0;

  for (let i = 0; i < nums.length; i++){
    sum += nums[i]

    while (sum - nums[j] >= s){
      sum = sum - nums[j];
      j++;
    }
    if (sum === s) {
      start = j;
      end = i;
    }
  }

  return [start, end]
}

console.log(minSubArrayLen(7, [2,3,1,2,4,2,1,6]))
