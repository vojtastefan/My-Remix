//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1849699945290375257
// Given a choice, which of the following function would you choose and why?

contract RecursiveContract {
    function factorial1(uint256 number) public pure returns (uint256){ 
        if (number == 0) {
        return 1;
        } else {
        return number * factorial1(number - 1);
        }
    }

    function factorial2(uint256 number) public pure returns (uint256){ 
        if (number == 0) return 1;
        uint256 result = 1;
        for (uint256 i = 1; i <= number; i++) {
        result *= i;
        }
        return result;
        
    }
}