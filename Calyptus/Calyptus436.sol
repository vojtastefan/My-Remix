// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Which function of the two will cost more gas? ⛽️

contract Calyptus436 {
    // 927 gas
    function addValues(uint256 x, uint256 y) public pure returns (uint256) {
        return x + y;
    }

    function multiplyValues(uint256 x, uint256 y)
    // 	1012 gas 
        public
        pure
        returns (uint256)
    {
        return x * y;
    }
}
