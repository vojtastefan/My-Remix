// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Immutable {
    // Write your code here
    address public immutable owner;
    
    constructor()  {
        owner = msg.sender;
    }
}