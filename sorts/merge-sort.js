// Merge Sort divides the array into subarrays and merges them back together in order
// it's good for linked lists or when you need a stable sort
// stable -- the only stable O(nlogn) sorting algorithm
// time: O(nlogn)
// space: O(n), or O(logn) for linked lists
function mergeSort(array) {
    if (array.length < 2) { return array; } // empty or length 1 array is already sorted

    let left = [];
    let right = [];
    for (let i = 0; i < array.length; i++) { // divide the array into 2 equal halves
        if (i < array.length / 2) {
            left.push(array[i]);
        } else {
            right.push(array[i]);
        }
    }
    // recursively sort the two halves
    left = mergeSort(left);
    right = mergeSort(right);

    // then merge them together
    return merge(left, right);
}

// this is where the sorting actually happens
function merge(left, right) {
    let merged = [];
    while (left.length > 0 && right.length > 0) {
        if (left[0] < right[0]) {
            merged.push(left.shift());
        } else {
            merged.push(right.shift());
        }
    }
    // add remaining elements at the end, one array will be empty so it doesn't matter if you concat both
    return merged.concat(left).concat(right); 
}