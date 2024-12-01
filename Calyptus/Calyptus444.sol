// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1839553085795942711
// What can go wrong with this airdrop contract that validates the legitimacy of the claimant 
// via a merkle hash verification.


import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
// https://docs.openzeppelin.com/contracts/3.x/api/cryptography

contract MerkleRootAirdrop {
    bytes32 public merkleRoot;
    mapping (bytes32 => bool) public alreadyClaimed;
    uint256 constant AIRDROP_AMOUNT = 1 ether; // or any other value

    constructor(bytes32 _merkleRoot) {
        merkleRoot = _merkleRoot;
    }

    // Only valid address should be able to call this function
    function airdrop(bytes32[] calldata proof, bytes32 leaf) external {
        require (MerkleProof.verify(proof, merkleRoot, leaf), "not verified");
        require( !alreadyClaimed[leaf], "already claimed airdrop");
        alreadyClaimed[leaf] = true;

        payable(msg.sender).transfer(AIRDROP_AMOUNT) ;
    }
        // A function to deposit ether to the contract
    receive() external payable {}
}