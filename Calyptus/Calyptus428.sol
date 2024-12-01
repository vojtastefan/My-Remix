// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// https://x.com/CalyptusCareers/status/1823655146435285092

contract QueueContract{
    uint256[] public queue;
    uint256 public head;
    uint256 public tail;

    function enqueue(uint256 value) external{
        queue.push(value);
        tail++;
    }

    function dequeue() external returns (uint256) {
        require(head < tail, "Queue is empty");
        uint256 value = queue[head];
        head++;
        return value;
    }
}