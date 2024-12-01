// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

//https://x.com/CalyptusCareers/status/1809074756227879128
//Would you be comfortable with such a loop in your contract? 🧐

contract Caluptus409 {
   uint256[] public  largeArray;

    function populateLargeArray(uint length) public {
        for (uint i = 0; i < length; i++) {
            largeArray.push(i);
        }
    }
}