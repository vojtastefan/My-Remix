// SPDX-License-Identifier:MIT
pragma solidity  ^0.8.0;

//https://x.com/CalyptusCareers/status/1795304044904214741
//Will the functions alpha and beta return the same value?
//If not, what will their individual values be? 🤔

contract Challenge {

    function alpha() public pure returns (uint32) {
        uint64 x = 500000;
        uint16 y = uint16(x + 65535);
        uint32 z = uint32(y);
        return z;
    }

    function beta() public pure returns (uint16) {
        uint64 x = 500000;
        uint32 y = uint32(x + 65535) ;
        uint16 z = uint16(y);
        return z;
    }
    ///////////////////////////////////////////////////////////
// We have two uint16s, we cast them to uint32 and add them together. What is the largest value that can be achieved?
    function q1(uint16 a, uint16 b) public pure returns (uint32) {
        uint32 a2 = uint32(a);
        uint32 b2 = uint32(b);
        uint32 z = a2 + b2;
        return z; //131070 = 65535 + 65535
    }

//We have two uint16s, we cast them to uint32 and multiply them together. What is the largest value that can be achieved?
    function q2(uint16 a, uint16 b) public pure returns (uint32) {
        uint32 a2 = uint32(a);
        uint32 b2 = uint32(b);
        uint32 z = a2 * b2;
        return z; //4294836225 = 65535 * 65535
    }

//We have a number x that is a uint16. How do we compute y such that x + y = 0?
    function q3(uint16 a) public pure returns (int16) {
        int16 z = int16(a) * -1;
        return z; //int16 (-32768 to 32767).
    }

     function q4(uint16 a) public pure returns (int32) {
        int32 z = int16(a) * -1;
        return z;
    }
}
