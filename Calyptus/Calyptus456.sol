// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//https://x.com/calyptus_web3/status/1850756893670547553
// From storage patterns Voter1 and Voter2, which one would you choose and why?

contract EnhancedVotingManager {
    struct Vote1 {
        address voter; // Address of the voter
        string candidate; // Name of the candidate
        string voterName; // Name of the voter
        uint256 timestamp; // Time when the vote was cast
        string comments; // Comments or reasons for the vote
    }

    mapping (bytes32 => Vote1) private votes1;

    function castVotel(string calldata candidate, string calldata voterName, string calldata comments) external {
        bytes32 key = keccak256(abi.encodePacked(msg.sender, candidate)) ;
        require(votes1[key].voter == address(0), "Already voted for this candidate");
        votes1[key] = Vote1({
        voter: msg.sender,
        candidate: candidate,
        voterName: voterName,
        timestamp: block.timestamp,
        comments: comments
        });
    }

    function getVote1(string calldata candidate) external view returns (Vote1 memory) {
        bytes32 key = keccak256(abi.encodePacked(msg.sender, candidate));
        return votes1[key];
    }

    struct Vote2 {
        string voterName; // Name of the voter
        uint256 timestamp; // Time when the vote was cast
        string comments; // Comments or reasons for the vote
    }
    mapping(address => mapping(string => Vote2)) private votes2;

    function castVote2(string calldata candidate, string calldata voterName, string calldata comments) external {
        require (bytes(votes2[msg.sender][candidate].voterName).length == 0, "Already voted for this candidate");
        votes2[msg.sender][candidate] = Vote2({voterName: voterName, timestamp: block.timestamp, comments: comments});
    }

    function getVote2(string calldata candidate) external view returns (Vote2 memory) {
    return votes2[msg.sender][candidate];
    }
}
