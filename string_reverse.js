/*
Algorithm
Two pointers at index 0 and last index
swap elements at pointers
left++, right--
break when left >= right

Time complexity: O(N) - Every element is touched
Space Complexity: O(1) - always two pointers
*/

const reverse = (input_string) => {
  let right = input_string.length - 1;
  let left = 0;
  let string = input_string.split("");
  while (left < right){
    [string[left], string[right]] = [string[right], string[left]];
    left++;
    right--;
  }
  return string.join('');
}
