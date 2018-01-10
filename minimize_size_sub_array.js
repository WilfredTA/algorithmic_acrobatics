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



Mental Model
  Two pointers - call them lead and follow
  Lead pointer runs until a condition X
  Then Follow pointer chases lead until Condition Y
  Do something within this window

  Plugging this into this problem (algorithm):
    Lead pointer runs until the sum of follow to lead is greater than target.
    Follow pointer runs until the sum of follow to lead is less than or equal to target
      Reason:
        When lead stops, we know for sure that the nums from follow to lead exceeds the target, so
        if a window between them exists with numbers that sum to target, it we can now find it

        When follow chases lead, it will do so until the sum between lead and follow is no longer greater than target. Therefore
        it is either less than or equal to. If it is less than, then we know there are no contiguous numbers that sum to the target.
        Why do we know this?
        This lead follow approach does this:
        When lead runs, it expands contiguous sub array into a window
        When follow chases, it contracts that contiguous sub array into a smaller window:
        [1,2,3,4]
        Lead gets: [1], [1,2], [1,2,3]
        Follow gets: [1,2,3], [2,3], [3]



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
  let start=0;
  let end=0;
  let answer = 0;

  for (let i = 0; i < nums.length; i++){
    sum += nums[i]

    while (sum - nums[j] >= s){
      sum = sum - nums[j];
      j++;
    }

    if (sum >= s) {
      start = j;
      end = i;

      if (end - start < answer || answer === 0){
       answer = end - start + 1;
      }
    }
  }

 return answer

}

console.log(minSubArrayLen(7, [2,3,1,2,4,2,1,6]))
