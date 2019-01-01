// Bubble Sort sorts in-place by comparing adjacent elements and swapping them if necessary,
// iterating over the array repeatedly until no more swaps are made
// Time: O(n**2) worst/average case, O(n) best case
// Space: O(1)
// basically any time you think you want to use bubble sort, you actually want insertion sort 

// could be optimized more by not iterating over the entire length each time,
// since the last el is always correct
function bubbleSort(array) {
    let swapped;
    do {
        swapped = false;
        for (let i = 1; i < array.length; i++) {
            if (array[i] < array[i - 1]) {
                swap(array, i, i - 1);
                swapped = true;
            }
        }
    } while (swapped);
    return array;
}

function swap(array, i, j) {
    let tempVal = array[i];
    array[i] = array[j];
    array[j] = tempVal;
}