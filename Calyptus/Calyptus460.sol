// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1854061786267312162
// Will the below sol file compile without error?

interface A {
    function foo(uint256 _x) external pure returns (uint256);
}

contract B1 is A {
    function foo(uint256 _x) public pure virtual returns (uint256) {
        return _x + 1;
    }
}

abstract contract B2 is A {}

contract C is B1, B2 {
    function foo(uint256 _x) public pure virtual override(A, B1) returns (uint256) {
        return super.foo(_x);
    }
}

contract D is B1,A {
    function foo(uint256 _x) public pure virtual override(A, B1) returns (uint256) {
        return super.foo(x);
    }
}