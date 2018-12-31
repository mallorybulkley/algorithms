// Insertion Sort iterates through each element & reverses to put it in its correct position
// within the already-sorted left portion of the array.
// good for nearly sorted or small arrays (~<10 elements)
// some quicksort implementations actually use insertion sort for small arrays
// best case: O(n) - already sorted
// worst/avg case: O(n**2) - reverse sorted
// space: O(1)
// also cool bc it's a stable sort
function insertionSort(array) {
    for (let i = 1; i < array.length; i++) {
        let j = i;
        while (j > 0 && array[j] < array[j - 1]) {
            let swapVal = array[j];
            array[j] = array[j - 1];
            array[j - 1] = swapVal;
            j--;
        }
    }
    return array;
}