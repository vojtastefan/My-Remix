// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Kill {
    function kill() external {
        // Write your code here
        selfdestruct(payable(msg.sender));
    }
}