//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
//Can you tell us the vulnerability in the following smart contract? 📜

contract SimpleStorage {
    mapping(address => uint256) public balances;
    uint256 public totalDeposited;
    uint256 public totalUsers;
    mapping(address => bool) public hasDeposited;

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than 0");
        if (balances[msg.sender] == 0) {
            totalUsers += 1;
            hasDeposited[msg.sender] = true;
        }   
        balances[msg.sender] += msg. value;
        totalDeposited += msg.value;
            
        
        // when a user with non zero balances deposit again, totalDeposited is not increased
    }

    function withdraw(uint256 _amount) public  { // not declared as payable
        require (balances[msg. sender] >= _amount, "Insufficient balance");
        /*if (balances[msg.sender] == _amount) {
            totalUsers -= 1;
             } */

        payable(msg.sender).transfer(_amount);
        totalDeposited -= _amount;
        balances[msg. sender] -= _amount;
       
        
    }
}