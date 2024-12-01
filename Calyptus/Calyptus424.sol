// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

/*
Do you know what is the difference between an indexed and an unindexed parameter
 in an event as shown in the image below? Tell us in the comments 💬

Also, tell us if one costs more gas than the other ⛽️
*/

contract MyContract {
    // Define an event with indexed and non-indexed parameters
    event ItemSet(bytes32 indexed key, uint256 value);

    mapping (bytes32 => uint256) public items;

    function setItem(bytes32 key, uint256 value) public {
        items[key] = value;
        emit ItemSet(key, value); // Trigger the event 
    }
}
/////////////////////////////////////////
// bytes32 = 0x7465737400000000000000000000000000000000000000000000000000000000