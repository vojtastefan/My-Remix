// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MessageLength{

string public message;

function setMessage(string calldata _message) public {
    message = _message;
}

function getMessageLength() public view returns(uint) {
        return bytes(message).length;
    }
}


