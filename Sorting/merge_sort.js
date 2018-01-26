function merge(arr1, arr2) {
  var i = 0;
  var j = 0;
  var merged = [];
  
  for (var k = 0; k < arr1.length + arr2.length; k++) {
    if (arr1[i] < arr2[j] || arr2[j] === undefined) {
     merged[k] = arr1[i];
     i += 1;
    } else {
     merged[k] = arr2[j];
    j += 1;
    }
  };
  return merged;
};

//console.log(merge([8, 9, 10],[3,5,6]));


function mergeSort(array) {
  if (array.length === 1) {
   return array; 
  }
  var length = array.length;
  
  var c = mergeSort(array.splice(0, (array.length+1) / 2));
  var d = mergeSort(array.splice((array.length)/2 - 1));
  
  return merge(c,d);
                    
};

console.log(mergeSort([8,3,4,1,7,6,2]));