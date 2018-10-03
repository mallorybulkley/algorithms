function quicksort(array) {
    if (array.length < 2) {
        return array;
    }

    const pivot_idx = Math.floor(Math.random() * array.length)
    const pivot = array[pivot_idx]

    const left = array.filter(x => x < pivot)
    const middle = array.filter(x => x === pivot)
    const right = array.filter(x => x > pivot)

    return quicksort(left).concat(middle).concat(quicksort(right))
}