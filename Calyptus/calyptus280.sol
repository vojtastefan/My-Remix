// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Challenge{
    function bar() public pure returns(uint16){
        uint32 a=100000;
        uint8 b = uint8(a);
        uint16 c = uint16(b);
        return c;
    }

    function baz () public pure returns(uint16){
        uint32 a=100000;
        uint16 b = uint16(a);
        uint8 c = uint8(b);
        return c;
    }
}

