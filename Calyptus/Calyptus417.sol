// SPDX-License-Identifier:MIT
pragma solidity ^0.8.24;

// What do the following functions return? Answer without using a compiler to run the code 🫡

contract Calyptus417 {
    function foo() public pure returns (bytes1, bytes4) {
        bytes2 a = 0x1234;
        bytes1 b = bytes1(a); //0x12
        bytes4 c = bytes4(a) ;//0x12340000
        return (b, c);
    }
}
/*
bytes1: 0x12
bytes4: 0x12340000
*/