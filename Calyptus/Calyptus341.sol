// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

//https://twitter.com/calyptus_web3/status/1778732323887833558
//Take a look at the SecretSolutionReward contract 👀
//Can you pinpoint any issues?

contract SecretSolutionReward {
    //bytes32 public constant secretHash = 0x564ccaf7594d66b1eaaea24fe01f0585bf52ee70852af4eac0cc4b04711cd0e2;
    bytes32 public constant secretHash =   0xb939cc784373693ae7c513789409c16feffff9bb8c5c1046afa60ea325227d20; // hash of "calyptus"
    // The secret hash to be solved
    uint public constant rewardAmount = 1 ether;
    // The reward amount to be given for solving the secret
    constructor() payable {}

    //Function to solve the secret and claim the reward
    function solveSecret(string memory solution) public {
        require (secretHash == keccak256(abi.encodePacked(solution)), "Incorrect answer");
        // Send the reward to the solver
        (bool sent, ) = msg. sender.call{value: rewardAmount}("");
        require(sent, "Failed to send reward");
    }
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
// added function by me to calculate hash of a word
    function getHash(string memory word) public pure returns (bytes32) {
        bytes32 a = keccak256(abi.encodePacked(word));
        return a;
    }

}