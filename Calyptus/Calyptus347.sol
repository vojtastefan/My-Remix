// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//https://twitter.com/calyptus_web3/status/1780808479969525928
//If given the option, which function would you opt for and why? 🤔

contract RecursiveContract {
    function factorial1(uint256 number) public pure returns (uint256) {
        // 	28571 gas with number = 56 (max number possible without recursion)
        if (number == 0) {
            return 1;
        } else {
        return number * factorial1(number - 1);
        }
    }

    function factorial2(uint256 number) public pure returns (uint256) {
        // 	24555 gas with number = 56 (max number possible without recursion)
        if (number == 0) return 1;
        uint256 result = 1;

        for (uint256 i = 1; i <= number; i++) {
            result *= i;
        }
        return result;
    }
    
}