 // SPDX-License-Identifier: MIT

pragma solidity 0.8.24;

contract VeryLargeNumber {
     
 function calculate() public pure returns (uint256) {
    uint256 result = (2 ** 800 + 1)  - 2 ** 800;
    return result;
    }
}