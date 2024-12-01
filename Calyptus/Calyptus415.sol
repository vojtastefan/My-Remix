// SPDX-License-Identifier:MIT
pragma solidity ^0.8.24;

//Which of the two functions in the contract is a better implementation and why? 🤔

contract Setter {
    address public owner;
    uint public value;

    constructor() {
        owner = msg.sender;
    }

    function setValue1(uint _newValue) external {
        require(msg.sender == owner, "Only the owner can set the value");
        value = _newValue;
    }

    function setValue2(uint _newValue) external {
        value = _newValue;
        require(msg.sender == owner, "Only the owner can set the value");
    }
}