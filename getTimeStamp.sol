// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract GetTimeStamp{
    uint256 public gameEndTime;

    // constructor() {
    //     gameEndTime = block.timestamp + 2 days;
    // }

     constructor() {
        gameEndTime = block.timestamp + 2 hours;
    }
}