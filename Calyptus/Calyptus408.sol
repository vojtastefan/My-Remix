// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

// Which of the following functions will not compile, and why? 🤔
//https://x.com/CalyptusCareers/status/1808769499195126103

contract Calyptus408 {
    function y1(uint8 a) external pure returns (uint8){
        return 1 << a;
    }

    function y2(uint8 a) external pure returns (uint8){
        return 1 * a;
    }
}
