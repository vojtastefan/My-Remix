// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// https://x.com/CalyptusCareers/status/1796099172325573121

//⚔️ Battle of the Checks!
//What security checks would you add to the functions in the smart contract below to enhance its security?

contract VulnerableToken {

    mapping (address => uint256) public balances;
    mapping(address => uint256) public lockTime;

    constructor() {
        balances[msg. sender] = 1000; // Initial supply
    }

    function lockToken(uint256 _time) public {
        //require(balances[msg.sender] > 0, "zero balance");
        lockTime[msg. sender] = block.timestamp + _time;
    }

    function unlockToken() public {
        //require(lockTime[msg.sender] < block.timestamp, "too early");
        lockTime[msg. sender] = 0;
    }
    
    
}
