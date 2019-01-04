// Implement a queue with 2 stacks.
// Your queue should have an enqueue and a dequeue method and it should be “first in first out” (FIFO).
// Optimize for the time cost of mm calls on your queue.These can be any mix of enqueue and dequeue calls.
// Assume you already have a stack implementation and it gives O(1)O(1) time push and pop.

class Queue {
    constructor() {
        this.enqueueStack = [];
        this.dequeueStack = [];
    }

    enqueue(val) {
        return this.enqueueStack.push(val);
    }

    dequeue() {
        if (this.dequeueStack.length === 0) {
            while(this.enqueueStack.length > 0) {
                this.dequeueStack.push(this.enqueueStack.pop());
            }
        }
        return this.dequeueStack.pop();
    }
}
