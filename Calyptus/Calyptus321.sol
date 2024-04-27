// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//https://twitter.com/calyptus_web3/status/1769951946553573511/photo/1

//Will you be able to deploy this contract? 📜

contract TokenBurner {
    uint256 public totalSupply;

    constructor (){
      totalSupply = (type(uint256).max * type(uint256).max) / type(uint256).max; //DONT WORK because of operation order and value overflow
      // totalSupply = (type(uint256).max / type(uint256).max) * type(uint256).max; THIS WILL WORK  

    }
    // Function to burn tokens, reducing the total supply
    function burn(uint256 amount) public {
        require(amount <= totalSupply, "Amount exceeds total supply");
        
        totalSupply -= amount;
    }    
}    