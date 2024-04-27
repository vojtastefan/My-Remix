// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.20;

// https://twitter.com/calyptus_web3/status/1763429086918017479

// What will the function return when given the inputs 1, 4, 5, 5? 
// Additionally, does the outcome vary depending on the order in which the inputs are provided?
contract Bitwise {
    uint256 public counter;

    function updateCounter(uint8 update) external {
    counter |= 1 << update;
    }
}    