// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// https://twitter.com/calyptus_web3/status/1760892245144670474/photo/1

// Which of the two functions provided will cost more gas and why?

contract SimpleContract {

    uint256 public number = 5;

    // Long-named function
    function ThisIsAVeryLongFunctionNameThatDoesTheSameThingAsTheShortOne() public {
    number++;
    }
}    

contract SimpleContractB {

    uint256 public number = 5;

    // Short-named function
    function A() public {
    number++;
    }
}