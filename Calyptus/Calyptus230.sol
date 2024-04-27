// SPDX-License-Identifier: MIT
pragma solidity >=0.8.20;

//Will the function below revert or go through when called? Share your reasoning 👇
//https://twitter.com/calyptus_web3/status/1769227172743405651

contract Calyptus320 {
    function testAssertion() public pure {
        int256 x = type(int256).min;
        unchecked {
        assert(-x == x) ;
        }    
    }
}