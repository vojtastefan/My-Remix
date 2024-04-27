// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract HashFunction {
    function hash(string memory _text)
        public
        pure
        returns (bytes4)
    {
        return bytes4(keccak256("_text"));
      
    }
}
//bytes4: 0x18318f3b
// 0x600121ca