//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// What are the default values of the below-mentioned variables?

contract Calyptus451 { 
    bool public _bool; // false
    string public _string; // 
    int public _int; // int256: 0
    uint public _uint; // int256: 0
    address public _address; // 0x0000000000000000000000000000000000000000

    enum ActionSet {Buy, Hold, Sell}
    ActionSet public _enum; // uint8: 0
}