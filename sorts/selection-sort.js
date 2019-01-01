// Selection Sort kinda sucks.
// it's an in-place sort that partitions the array into sorted & unsorted parts,
// iterates through unsorted part, finds the minimum element,
// then moves it to the back of the sorted part.
// the only positive is that it only makes O(n) swaps, so if swaps are really expensive it could be useful
// Time: O(n**2) - best/worst/average
// Space: O(1)
// not stable
function selectionSort(array) {
    for (let partitionIdx = 0; partitionIdx < array.length - 1; partitionIdx++) {
        let minIdx = partitionIdx;
        for (let i = partitionIdx + 1; i < array.length; i++) {
            if (array[i] < array[minIdx]) {
                minIdx = i;
            }
        }
        let swapVal = array[minIdx];
        array[minIdx] = array[partitionIdx];
        array[partitionIdx] = swapVal;
    }
    return array;
}