// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// https://x.com/calyptus_web3/status/1835566819131670898

//So, which of the below is your favourite way of declaring a max uint value, and why? 
// Also, which one's going to give the compiler a hard time?
contract Calyptus439{
    uint public choiceA = type(uint256).max; 
    // 2424 gas

    uint public choiceB = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    // 2447 gas

    uint public choiceC = 115792089237316195423570985008687907853269984665640564039457584007913129639935;
    // 2469 gas

    // uint public choiceD = uint256(-1);
    // Explicit type conversion not allowed from "int_const -1" to "uint256".

    uint public choiceE = 2**256 - 1;
    // 2403 gas
 //////////////////////////////////////////////////////////////////////////////////////
    uint public choiceF = type(uint256).min;

    int public choiceG = type(int256).max;
    int public choiceH = type(int256).min; 
 
    
}