// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// https://x.com/calyptus_web3/status/1827260637132529771

// The Palindrome Player needs to verify if a string reads the same forwards and backwards. 
// What’s wrong with this function? 🧐

contract Calyptus432{
    function isPalindrome(string memory s) public pure returns (bool) {
        bytes memory strBytes = bytes(s) ;
        for (uint i = 0; i < strBytes.length; i++) {
            if (strBytes[i] != strBytes[strBytes.length - 1 - i]) return false;
        }
        return true;
    }

    function isPalindromeTillHalfLengthOfString(string memory s) public pure returns (bool) {
        bytes memory strBytes = bytes(s) ;
        for (uint i = 0; i < strBytes.length / 2 ; i++) {
            if (strBytes[i] != strBytes[strBytes.length - 1 - i]) return false;
        }
        return true;
    }
}
//////////////////////////////////////////////
/*
The loop runs from i = 0 to i < strBytes.length, 
but it should only run up to the halfway point of the string (i.e., i < strBytes.length / 2). 
By running the loop over the entire length of the string, 
the function is checking the characters against themselves once it passes the halfway point
*/