// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.20;

// Can you tell what's wrong with the following smart contract?

contract CalldataMemoryDemo {

    function manipulateData(uint256[] calldata data) 
    external
    pure
    returns
    (uint256) {
        data [0] = 456;
        return (data[0]);
    }
}