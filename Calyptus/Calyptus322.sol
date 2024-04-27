// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//https://twitter.com/calyptus_web3/status/1770717787146621178

//What's the output of compareExponentiations function with inputs: 2, 3, 4? 🧐
//Does the output change with Solidity version 0.7.6?

contract ExponentiationDemo {

    // Function to calculate a**(b**c) (right-associative)
    function calculateRightAssociative(uint256 a, uint256 b, uint256 c) public pure returns (uint256) {
        return a ** (b ** c);
    }

    // Function to simulate (a**b)** (left-associative)
    function calculateLeftAssociative(uint256 a, uint256 b, uint256 c) public pure returns (uint256) {
        return (a ** b) ** c;
    }

    // Function to compare direct calculation with both methods
    function compareExponentiations(uint256 a, uint256 b, uint256 c) public pure returns (string memory) {
        uint256 directCalculation = a ** b ** c;
        uint256 rightAssociative = calculateRightAssociative(a, b, c);
        uint256 leftAssociative = calculateLeftAssociative(a, b, c);

        if (directCalculation == rightAssociative) {
            return "Direct calculation matches right-associative method";
            
        } else if (directCalculation == leftAssociative) {
            return "Direct calculation matches right-associative method";
        } else {
        return "Direct calculation does not match either method";}
    }

    
}
