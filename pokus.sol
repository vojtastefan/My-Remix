// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract C {
    uint256 public finial;
    uint public b;

    function f() public pure returns (uint256, bool, uint256){
    return (7, true, 5);
    }

    function g() public {
        (uint256 c,,uint256 k) = f();
        (c, k) = (2*k, 2*c) ;
        finial = c;
        b = k;
    }
}


