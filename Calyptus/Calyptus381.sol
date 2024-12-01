// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//https://x.com/CalyptusCareers/status/1795666381611942108
//What will the howManyEvens() function return if the input is (0, 20)? 🧐

contract HowManyEvens {
    function howManyEvens(uint256 startNum, uint256 endNum) public pure returns (uint256){
        uint256 answer;

        assembly {                                                        // iteruje po 10
            for { let i := startNum } lt(i, add(endNum, 1)) { i := add(i, 0xa) } { 
                 if iszero(i) { continue }
                 if iszero(mod(i, 2)) { answer := add(answer, i) }
            }
        }
        return answer;
        /*
        Oxa = 10
        Loop 1: i = 0
        Loop 2: i = 10 (0 + Oxa)
        Loop 3: i = 20 (10 + Oxa)
        0 % 2 = 0 pass
        10 % 2 = 0 pass
        20 % 2 = 0 pass
        returns 30
        */    
    }
    ///////////////////////////////////////////////////////
    
     function howManyEvens2(uint256 startNum, uint256 endNum) public pure returns (uint256){
        uint256 answer;

        assembly {                                                 //iteruje po 1
            for { let i := startNum } lt(i, add(endNum, 1)) { i := add(i, 1) } { 
                 if iszero(i) { continue }
                 if iszero(mod(i, 2)) { answer := add(answer, i) }
            }
        }
        return answer;
    }
}