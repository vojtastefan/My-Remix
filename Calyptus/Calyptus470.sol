// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1862398596840038858
// Below is a contract having a simple counter that stores a large number 
// and provides a function to retrieve this number downcasted in uint8. 
// Integers of which number series will all return zero?

contract Contract {
    uint256 private Number;

    function setNumber(uint256 _number) external {
        Number = _number;
    }

    function getNumber() external view returns (uint8) {
        return uint8(Number);
    }

}
// answer: 256 * i ; i =0,1,2,..., 2*255