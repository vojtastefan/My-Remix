// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EtherWallet {
    address payable public owner;
    
    receive() external payable{}

    constructor() {
        owner = payable(msg.sender);
    }
    
    //This function will send _amount of Ether to owner. 
    //Only the owner can call this function.  
    function withdraw (uint _amount) external payable {
        require( msg.sender == owner);
      
        (bool success, ) = owner.call{ value: _amount}("");
        require(success, "failed to send Ether");
    
    
    }
}