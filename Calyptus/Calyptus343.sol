// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//https://twitter.com/calyptus_web3/status/1779358928205217955
//Can you identify the flaw in this SecureVault smart contract? 📜

contract SecureVault {
    // slot 0
    uint256 private secretCode;

    constructor(uint256 _secretCode) {
        secretCode = _secretCode;
        User memory newUser = User({id: 0, secretCode: bytes32(_secretCode)});
        userList.push(newUser);
        idToUser[0] = newUser;
    }

    struct User {
        uint id;
        bytes32 secretCode;
    }

    // slot 1
    User[] public userList;

    // slot 2
    mapping (uint => User) public idToUser;

    function getLocationInArray(
    uint slot,
    uint index,
    uint elementSize
    ) public pure returns (bytes32) {
        uint256 location = uint(keccak256(abi.encodePacked(slot))) +(index * elementSize);
        return bytes32(location);
    }
}