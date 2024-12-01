// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// https://x.com/calyptus_web3/status/1837016357730148558
/* 
Check out this multi-transfer smart contract that can be owned by multiple parties. 
To transfer, the signature of all parties is mandatory. What can go wrong?
*/

contract VulnerableMultiTransfer {
    mapping(address => bool) public owners;
    address[] public ownerList;

    constructor(address[] memory _owners) {
        require(_owners.length > 0,"Must have at least one owner");
        for (uint256 i = 0; i < _owners.length; i++) {
            owners[_owners [i]] = true;
            ownerList.push(_owners[i]);
        }
    }

    function multiTransfer(address[] memory to, uint256[] memory amounts, bytes[] memory signatures) public {
        for (uint256 i = 0; i < ownerList.length; i++) {
            bytes memory signature = signatures[i];
            require (signature.length > 0, "Invalid signature");
        }
        // Imagine this is a representation of ecrecover and then signature verification.

        for (uint256 i = 0; i < to.length; i++) {
            payable(to[i]).transfer(amounts[i]);
        }
    }
}
    