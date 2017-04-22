# How to Prepare
1. Try to solve the problem on your own - think about space and time efficiency
2. Write the code on paper/whiteboard
3. Test your code - on paper
4. Type your paper code as-is into a computer

# Core Concepts
Know how to use and implement, and the time and space complexity where applicable
## Data Structures
* Linked Lists
* Trees, Tries & Graphs
* Stacks & Queues
* Heaps
* Vectors / ArrayLists
* Hash Tables !

## Algorithms
* BFS
* DFS
* Binary Search
* Merge sort
* Quick sort

## Concepts
* Bit manipulation
* Memory (stack vs heap)
* Recursion
* Dynamic Programming
* Big O Time & Space

# Walking through a problem
1. Listen
2. Example - debug it
3. Brute force
4. Optimize (BUD)
  * Bottlenecks
  * Unnecessary work
  * Duplicated work
5. Walk through in detail
6. Implement - write modular beautiful code
Keep talking!


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
