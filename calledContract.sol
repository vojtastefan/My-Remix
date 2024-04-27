// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
 contract CalledContract{
    uint256 public sum;

    function add(uint256 _a) external  {
        sum += _a;
    }
 }