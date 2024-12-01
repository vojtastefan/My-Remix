// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

//Guess the output of test1() and test2() 🧪

contract Testing {
    uint n = 7;
    uint x = 8;
    
    function test1() public view returns (uint n){
        return n;
    }

    function test2() public view returns (uint x){
        uint n = 4;
        return n+x;
    }
}