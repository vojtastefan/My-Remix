// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Example {

    event Log(string message);

    modifier foo() {
        emit Log("foo");
        _;
    }

    modifier bar() {
        emit Log("bar");
        _;
    }

    function test() public foo bar {
        emit Log("function body");

    }
}
