//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//Examine this smart contract and predict the outcome of calling test() 🔍
contract MyContract {
    uint8 _myNumber = 42;

    function test() public view returns (uint8 number) {
     uint8 myNumber = _myNumber;
    //number = _myNumber;
    
    }
}