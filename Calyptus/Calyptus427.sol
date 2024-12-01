// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

contract SimpleVoting{

    mapping(address=> bool) public hasVoted;
    mapping(uint256 => uint256) public voteCounts;
    uint256 public totalVotes;

    function vote(uint256 candidateId) external {
        require( !hasVoted[msg.sender], "Already voted");
        hasVoted[msg.sender] = true;
        voteCounts[candidateId]++;
        totalVotes++;
    } 

    function getWinner() external view returns (uint256) {
        uint256 maxVotes = 0;
        uint256 winningCandidate = 0;
        for(uint i = 0; i < 10; i++) {
            if(voteCounts[i] > maxVotes ){
                maxVotes = voteCounts[i];
                winningCandidate = i;
            }
        }
        return winningCandidate;
    }
}