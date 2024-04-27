// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//https://twitter.com/calyptus_web3/status/1776176422630920219
//Examining this Bank contract closely 🏦

//What potential risks do you foresee? 👀
contract Bank {
    mapping(address => uint256) public balances;
    uint256 public totalBalance;

    // Custom Errors
    error InsufficientFunds();
    error BalanceMismatch();

    function deposit() external payable {
        balances[msg.sender] += msg.value;
        totalBalance += msg.value;
    }

    function withdraw(uint256 amount) external {
        if (balances[msg.sender] < amount) revert InsufficientFunds();
        if (address(this).balance != totalBalance) revert BalanceMismatch();
        balances[msg.sender] -= amount;
        totalBalance -= amount;
        payable(msg.sender).transfer(amount);
    }
}
