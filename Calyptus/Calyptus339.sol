// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

//https://twitter.com/calyptus_web3/status/1777635390989414673
//If we deposit 1 Eth in this contract, and then call the destroyContract function, what will happen to the Eth? 

contract SelfDestructAssembly {

    // Function to deposit Ether into the contract
    function deposit() public payable {}

    // Function to check the contract's balance
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Self-destruct function using assembly with the contract's address
    function destroyContract() public {
        assembly {
            selfdestruct(address())
        }
    }
}
