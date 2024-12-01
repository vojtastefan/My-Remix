// SPDX-License-Identifier:MIT
pragma solidity >= 0.8.24;

//https://x.com/CalyptusCareers/status/1799290258460197058
//Would you be comfortable with such a loop in your contract? ♽

contract Loop{
    uint[] public largeArray;

    function populateLargeArray(uint length) public {
        for ( uint i = 0; i < length; i++){
            largeArray.push(i);
        }
    }
}