// SPDX-License-Identifier:MIT
pragma solidity  0.8.20;

// https://x.com/CalyptusCareers/status/1794579216928739340

//Will the .sol file below compile without any errors? 🧐

interface A {
    function foo(uint256 _x) external pure returns (uint256);
}

contract B1 is A {
    function foo(uint256 _x) public pure virtual returns (uint256) {
    return _x + 1;
    }
}
abstract contract B2 is A {}

contract C is B1,B2 {
    function foo(uint256 _x) public pure virtual override(A, B1) returns (uint256) {
        return super.foo(_x);
    }
}

contract D is  B1,A {
    function foo(uint256 _x) public pure virtual override(A, B1) returns (uint256) {
        return super.foo(_x);
    }
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// contract D is  A,B1 {
//     function foo(uint256 _x) public pure virtual override(A, B1) returns (uint256) {
//         return super.foo(_x);
//     }
// }