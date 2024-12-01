// SPDX-License-Identifier:MIT
pragma solidity   ^0.8.20;

//https://x.com/CalyptusCareers/status/1805450877651611898

/* This smart contract is used to register users for 
a future airdrop that will be distributed equally among all listed users 🪂 

What could go wrong? */

contract UserRegistrationSolution {
    mapping (address => bool) public registeredUsers;
    address[] public registeredUserList;

    function registerUser() external {
        registeredUsers[msg.sender] = true;
        registeredUserList.push(msg.sender);
    }

    function isUserRegistered(address userAddress) external view returns (bool) {
        return registeredUsers[userAddress];
    }

    function getRegisteredUserCount() external view returns (uint256) {
        return registeredUserList.length;
    }
}

////////////////////////////////////////
// everyone can register multiple times
