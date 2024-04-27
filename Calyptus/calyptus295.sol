// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

//https://twitter.com/calyptus_web3/status/1758355557734351220/photo/1

contract Challenge {
    function foo(uint256 number) public pure returns (bool) {
        return (number & 1) == 1;
    }
    function bar(uint256 number) public pure returns (bool) {
        return (number & 1) == 0;
    }
}