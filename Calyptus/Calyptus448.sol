//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1843169406228033550

/*
Do you know what is the difference between an indexed and an unindexed parameter in an event, 
as shown in the picture? Tell us in the comments. Also tell us if one costs more gas than the other.
*/

contract MyContract{
    // Define an event with indexed and non-indexed parameters
    event ItemSetIndexed(bytes32 indexed key, uint256 value);
    event ItemSetUnindexed(bytes32 key, uint256 value);

    mapping (bytes32 => uint256) public items;
    bytes32 public data = keccak256("Hello, World!");

    function setItemIndexed(bytes32 key, uint256 value) public {
        items[key] = value;
        emit ItemSetIndexed(key, value); // Trigger the event
    }

    function setItemUnindexed(bytes32 key, uint256 value) public {
        items[key] = value;
        emit ItemSetUnindexed(key, value);
    }
}