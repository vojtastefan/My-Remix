//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//https://twitter.com/CalyptusCareers/status/1783804590472741279
//Which of the following comparisons is better and why?

contract DivisionComparison {
    function compareFractions1(
    uint256 a,
    uint256 b,
    uint256 c,
    uint256 d
    ) public pure returns (bool){
        return a / b > c / d; 
        // 8/9 > 7/9 but function returns "false" as 0 > 0 is false
    }

    function compareFractions2(
    uint256 a,
    uint256 b,
    uint256 c,
    uint256 d
    ) public pure returns (bool) {
        return a * d > c * b;
        // 8 * 9 > 7 * 9 returns "true"
    }
}


