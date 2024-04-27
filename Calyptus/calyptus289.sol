// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DivisionDemo {

 function divide(uint256 numerator) public pure returns (uint256) {
    uint256 result;
    unchecked {
    result = numerator / 0;
    }
    return result;
    }
}