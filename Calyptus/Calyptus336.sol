// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

//https://twitter.com/calyptus_web3/status/1776459865575096738
//What are the possible vulnerabilities within this Wallet contract? 👛

contract Wallet {
    address creator;

    mapping (address => uint256) balances;

    constructor() {
        creator = msg .sender;
    }

    function deposit() public payable {
        assert(balances[msg.sender] + msg.value > balances[msg. sender]);
        balances[msg .sender] += msg.value;
    }

    function withdraw (uint256 amount) public {
        require(amount >= balances[msg. sender]);
        balances[msg. sender] -= amount;
        payable(msg. sender).transfer(amount);
    }    
    //I In an emergency the owner can migrate all funds to a different address.
    function migrateTo(address to) public {
        require (creator == msg. sender);
        payable(to).transfer(address(this).balance);
    }
}    
