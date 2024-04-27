// SPDX-License-Identifier: MIT
pragma solidity 0.7.0;

//https://twitter.com/calyptus_web3/status/1775797929334165810/photo/1
//Can you identify potential issues with this smart contract? 🔍

contract Token {
    mapping (address => uint256) public balances;

    function transfer(address _to, uint256 _amount) public {
        require (balances[msg. sender] - _amount >= 0, "Insufficient balance");
        balances [msg. sender] -= _amount;
        balances [_to] += _amount;
    }
}