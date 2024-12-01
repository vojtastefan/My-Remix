// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1853374024480342464
// What will the below function return if the inputs are: 1,4,5,5? 
// Does the sequence in which inputs are fed change the result?

contract Bitwise {
    uint256 public counter;

    function updateCounter(uint8 update) external{
        counter |= 1 << update;
    }
}

/*
AI answer:

This is a simple Solidity contract that uses bitwise operations to keep track of unique events.
The `updateCounter` function takes an integer `update` as input and performs the following operation:
- It shifts the bits left by the value in `update`, 
creating a new number with only one bit set (at position `update`). 
This is done using the expression: `1 << update`.

- Then, it uses a bitwise OR (`|=`) to add this new number into an existing counter variable. 
If there's already a 1 at that same position in `counter`, then no change will occur.
This means each time you call `updateCounter(update)` with a different value of `update`, 
the corresponding bit in the counter gets set (if it wasn't previously). 
The total number of bits set indicates how many times unique events have occurred, 
since each event is given its own position. 
Think of this like logging into an array using bitwise OR to keep track of positions: 
every time you update a certain slot, 
that's recorded in the counter by setting one bit at that index if not already present.
*/