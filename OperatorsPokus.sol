// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OperatorsPokus {
    uint16 public a = 20;
    uint16 public b = 10;

    bool public eq = a == b;
   
    bool public noteq = a != b;
    
    bool public gtr = a > b;
 
    bool public les = a < b;
 
    bool public gtreq = a >= b;
 
    bool public leseq = a <= b;

    uint public inc = ++a;

    uint public dec = --b;
   



     
}