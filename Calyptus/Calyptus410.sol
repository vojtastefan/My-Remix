// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

// https://x.com/CalyptusCareers/status/1809437156701540487

// What will the following function return if the inputs are 1, 4, 5, and 5? 🔢
// response: 0 16 32 32
// Does the order in which the inputs are provided affect the result?
// response: no

contract Bitwise {
    uint256 public counter;

    function updateCounter(uint8 update) external {
        counter = 1 << update;
    }
}

/*
Inside the function, the operation 1 << update performs a left shift on the number 1 by update places. 
In binary representation, shifting 1 to the left by any number of places effectively multiplies the original number 
(in this case, 1) by 2 raised to the power of the number of places shifted. 
For example, if update is 3, then 1 << 3 equals 8 because (2^3 = 8).
*/