// SPDX-License-Identifier:MIT
pragma solidity ^0.8.24;

// Will the following functions return the same value?
//Answer without putting the code through the compiler 👇

contract Calyptus419{
    function bar() public pure returns (uint16) {
        uint32 a = 100000;  // 100 000 in binary is 11000011010100000
        uint8 b = uint8(a);
        uint16 c = uint16(b);
        return c;
    }

    function baz() public pure returns (uint8) {
        uint32 a = 100000; 
        uint16 b = uint16(a);
        uint8 c = uint8(b);
        return c;
    }
}
/*
Yes in this case they will, however it will not always be the case. 
For this, it is best to look at the values in binary to see why. 

100,000 in Binary is 11000011010100000 (17 digits). 
The value is initially stored as a uint32, which pads extra 0's to the left. 
When casting to a smaller value, the X right most values are taken. 
So in the case of Bar, the value of b takes the 8 right most digits of 11000011010100000 or 10100000. 
Casting to a larger value, just adds extra 0's padded to the left. 10100000 is equal to 160 in decimal. 

In the case of Baz, the process starts the same, 
except the 16 right most bits digits are taken in the first cast (1000011010100000) and from that, 
the 8 right most digits are taken (10100000) 
Since 10100000 is fundamentally equal to 0000000010100000 the values are treated the same (160 in decimal) 
*/