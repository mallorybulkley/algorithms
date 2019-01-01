// Heap Sort first turns the list into a heap (O(n)), 
// then extracts the min/max (depending on sort order) repeatedly until the final list is sorted (nlogn)
// not stable
// Time: O(nlogn) - best/worst/average
// Space: O(1) - in place
function heapSort(array) {
    turnIntoHeap(array);

    // extract max and move to end of array until all elements have been extracted
    let lastIdx = array.length - 1;
    while (lastIdx > 0) {
        swap(array, 0, lastIdx); // sorted portion is at the end of the array
        heapify(array, 0, lastIdx); // heap portion of the array ends where sorted portion begins
        lastIdx--;
    }

    return array;
}

function turnIntoHeap(array) {
    for (let i = Math.floor(array.length / 2 - 1); i >= 0; i--) {
        heapify(array, i, array.length);
    }
}

function heapify(array, parentIdx, length) {
    while (parentIdx < length) {
        let swapIdx = parentIdx;
        let leftChildIdx = (2 * parentIdx + 1);
        let rightChildIdx = (2 * parentIdx + 2);
        if (leftChildIdx < length && array[leftChildIdx] > array[swapIdx]) {
            swapIdx = leftChildIdx;
        }
        if (rightChildIdx < length && array[rightChildIdx] > array[swapIdx]) {
            swapIdx = rightChildIdx;
        }
        if (swapIdx === parentIdx) { return; }
        swap(array, swapIdx, parentIdx);
        parentIdx = swapIdx;
    }
}

function swap(array, i, j) {
    let tempVal = array[i];
    array[i] = array[j];
    array[j] = tempVal;
}