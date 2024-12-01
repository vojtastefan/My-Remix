// SPDX-License-Identifier:MIT
pragma solidity >= 0.8.24;

//https://x.com/CalyptusCareers/status/1798203096146878707
//Calling negate... What could possibly go wrong? 🤔

contract Complement {
    int8 public number = -128;

    function negate() public {
        number = -number;
    }

//////////////////////////////////////////////////////////
 function negate2(int8 a) public pure returns (int8) {
        int8 b = -a;
        return b;  
    }
}
/*
Min. value int8 = -128
Max. value int8 = 127



*/