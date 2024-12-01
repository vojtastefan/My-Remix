// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1851481670932738516
// Checkout this Ownership contract. Can a malicious attacker gain it's ownership?

contract VulnerableOwnership {
    address public owner;
    mapping (address => uint256) public balances;

    constructor (){
        owner = msg.sender; // Owner initialized
    }

    function deposit() public payable {
        require(msg.value > 0, "Must send positive value");
        balances[msg.sender] += msg .value;
    }

    function withdrawAll() public {
        require(msg.sender == owner,"Only owner can withdraw");
        payable(owner).transfer(address(this).balance);
    }

    function renounceOwnership() public {
        require(msg.sender == owner, "Only owner can renounce ownership");
        owner = address(0); // Owner renounced
    }

    function resetOwner(bytes32 newOwnerHash, uint8 v, bytes32 r, bytes32 s) external {
        address signer = ecrecover(newOwnerHash, v, r, s);
        require(signer == owner, "Invalid signer");
        owner = msg.sender; // Owner assignment
    }
}
        