// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.24;


//https://twitter.com/calyptus_web3/status/1773575860039069840/photo/1
//What will the "y" public variable from contract B return? Can you guess why? 

contract A {
     uint  immutable x;
    //uint public x;

    constructor(){
        x = 42;
    }

    function f() internal view returns(uint256){
     return x;
    }
}    

contract B is A {
    uint public y = f();
}