//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//https://calyptus.co/lessons/bytes-and-byte-arrays/
contract MyContract {

    bytes4 a = 0x13456789;
    bytes2 b = 0x1234;
    bytes c = "nazdar bazar";
    
    function compare() public view returns (bool) {
        return b > a;
    }

    function bitOperations() public view returns(bytes4) {
        return a & b;
    }

    function leftShift() public view returns (bytes4) {
        return a <<1;
    }

    function returnAtIndex(uint _index) public view returns (bytes1) {
        return b[_index];
    }

    function returnLength() public view returns(uint) {
        return c.length;
    }
}

/*
Below is a list of operations that can be performed on a bytes type variable:

• Comparisons: <=, <, ==, !=, >=, > (evaluate to bool)
• Bit operators: &,|, ^ (bitwise exclusive or), ~ (bitwise negation)
• Shift operators: << (left shift), >> (right shift)
• Index access: If x is of type bytesl, then [k] for 0 <= k < I returns the k th byte (read-only).
*/