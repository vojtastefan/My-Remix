// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//https://twitter.com/calyptus_web3/status/1775459091017502803
//Sort the contracts below by the gas used in calling their function, 
//from least expensive to most expensive ⛽️

contract One{
    // 50352 gas
    uint256 public number;

    function incrementByOne() public returns (uint256){
    number += 1;
    return number;
    }
}    
contract Two{
    //50336 gas
    uint256 public number;

    function incrementByOne() public returns (uint256){
    number = number +1;
    return number;
    }
}    

contract Three{
    //50167 gas
    uint256 public number;

    function incrementByOne() public returns (uint256){
    return number ++;
    }
}    

contract Four{
    //50160 gas
    uint256 public number;

    function incrementByOne() public returns (uint256){
    return ++number;
    }
}    