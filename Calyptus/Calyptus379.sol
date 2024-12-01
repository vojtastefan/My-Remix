// SPDX-License-Identifier:MIT
pragma solidity >= 0.8.24;

//https://x.com/CalyptusCareers/status/1794941623463227838/photo/1
//What does the function bar return? 🔍

contract Bytes{
    function bar() public pure returns (bytes2, bytes3) {
        bytes4 x = 0x56789A;
        //bytes4 x = 0x56789A00;
        bytes2 y = bytes2(x);  //0x5678
        bytes3 z = bytes3(x);  //0x56789a
        return (y, z);
}
}