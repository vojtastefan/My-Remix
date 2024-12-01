//SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

//What’s the main issue with how this contract tries to implement a linked list? 📋

contract LinkedList {
    struct Node {
        uint256 data;
        uint256 next;
    }

    mapping (uint256 => Node) public nodes;
    uint256 public head;
    uint256 public tail;
    uint256 public length;

    function addNode(uint256 _data) public {
        length++;
        nodes[length] = Node(_data, 0);
        if (tail == 0) {
            head = length;
        } else {
        nodes[tail].next = length;
        }   
        tail = length;
    }
}