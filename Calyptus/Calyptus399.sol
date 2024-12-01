// SPDX-License-Identifier:MIT
pragma solidity   ^0.8.20;

//https://x.com/CalyptusCareers/status/1804726095872147884
//Guess the function of the given modifier 👇

contract Calyptus399{
    modifier modify {
        assembly {
            if tload(0) { revert(0, 0) }
            tstore(0,1)
        }
        _;
        assembly{
            tstore(0,0)
        }
        
    }
}