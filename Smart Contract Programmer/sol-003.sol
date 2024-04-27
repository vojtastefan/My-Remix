// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FunctionIntro {
    function add(uint x, uint y) external pure returns (uint) {
        return x + y;
            }
    function sub(int x, int y) external pure returns (int) {
        return x - y;
    }        
}