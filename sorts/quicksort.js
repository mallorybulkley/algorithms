// Quicksort divides the array into two halfs - larger & smaller, around a pivot element
// then recursively quicksort each half and concat them together
// best/avg case: O(nlogn) - the recursive calls should each have ~half the remaining array
// worst case: O(n**2) if we choose the wrong pivot every time
// NOT stable
function quicksort(array) {
    if (array.length < 2) { return array; } // empty or length 1 array is already sorted

    const pivotIdx = Math.floor(Math.random() * array.length); // random pivot protects against pathological datasets
    const pivot = array[pivotIdx];

    const left = array.filter(x => x < pivot);
    const middle = array.filter(x => x === pivot);
    const right = array.filter(x => x > pivot);

    return quicksort(left).concat(middle).concat(quicksort(right));
}

// Note: in-place version of quicksort will partition the array and move elements in place
// rather than creating new left/right/middle arrays; the pivot el is locked in place after each
// partioning, and then quicksort can be run on the left indices and right indices