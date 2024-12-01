// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

//This code won't compile! 🚨
//Can you help our intern figure out why, without using the compiler?

contract CanNotCompile {
    function withdraw(uint256) public {}
    function OwnerTransferV7b711143(uint256) public{}
}

/*
Function signature hash collision...
viz  https://evm-function-selector.click
*/
    