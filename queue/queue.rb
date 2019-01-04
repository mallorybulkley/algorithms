# Implement a queue with 2 stacks.
# Your queue should have an enqueue and a dequeue method and it should be “first in first out” (FIFO).
# Optimize for the time cost of mm calls on your queue. These can be any mix of enqueue and dequeue calls.
# Assume you already have a stack implementation and it gives O(1)O(1) time push and pop.

class MyQueue
    def initialize
        @enqueue_stack = [];
        @dequeue_stack = [];
    end

    def enqueue(val)
        @enqueue_stack.push(val);
    end

    def dequeue()
        if @dequeue_stack.length > 0
            @dequeue_stack.pop
        else
            @enqueue_stack.length.times { @dequeue_stack.push(@enqueue_stack.pop) }
            @dequeue_stack.pop
        end
    end
end