// SPDX-License-Identifier: MIT
pragma solidity >=0.8.20;

//https://twitter.com/calyptus_web3/status/1768864798366650786
//Which of the following functions will return a larger value and why? 🧐

contract ExponentiationDemo {

    function manualExponentiation(uint256 x) public view returns (uint256 gasUsed) {
        uint256 gasBefore = gasleft();
        uint256 result = x * x * x;
        uint256 gasAfter = gasleft();
        gasUsed = gasBefore - gasAfter;
    }

    function expExponentiation(uint256 x) public view returns (uint256 gasUsed) {
        uint256 gasBefore = gasleft();
        uint256 result = x ** 3;
        uint256 gasAfter = gasleft();
        gasUsed = gasBefore - gasAfter;
    }
}    