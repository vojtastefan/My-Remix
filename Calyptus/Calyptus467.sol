// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1859907180742193404
// Can you spot an issue in the SecretSolutionReward contract?
// deployed on Sepolia at 0xF3fe1f468A4Aa2298d662386D2b45E6E2De19531

contract SecretSolutionReward {
    bytes32 public constant secretHash = 0x564ccaf7594d66b1eaaea24fe01f0585bf52ee70852af4eac0cc4b04711cd0e2;
    // The secret hash to be solved

    uint public constant rewardAmount = 0.001 ether;
    // The reward amount to be given for solving the secret

    constructor() payable{ 
    }  

    // Function to solve the secret and claim the reward
    function solveSecret(string memory solution) public {
        require(secretHash == keccak256(abi.encodePacked(solution)), "Incorrect answer");
        // Send the reward to the solver
        (bool sent, ) = msg. sender.call{value: rewardAmount} ("");
        require(sent, "Failed to send reward");
    }
}

