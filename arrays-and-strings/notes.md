
# Arrays & Strings
## Hash Tables
Simple, common implementation: array of linked lists + hash code function
- hash(key) % array_length
- Worst case O(n) -> high number of collisions
- Good implementation with minimal collisions -> O(1)

Alternative: balanced binary search tree
- O(log n) lookup time
- Possibly uses less space (no longer allocating a large array)
- Can iterate through keys in order if necessary

## ArrayList & Resizable Arrays
ArrayList dynamically resizes itself as needed while still providing O(1) access
- When array is full, it doubles in size
- Each doubling takes O(n) time, but happens so rarely that amortized time is still O(1)
