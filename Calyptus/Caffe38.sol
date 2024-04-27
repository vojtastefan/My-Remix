// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
//When we call the test() function, in what order will the modifiers be emmitted?

contract Example {
    event Log(string message);

    modifier foo() {
        emit Log("foo");
        _;
    }

    modifier bar(){
        emit Log("bar");
        _;
    }
    
    function test() public foo bar {
        emit Log("function body");
    }
}
//#########################################################################################
//Answer: foo, bar, function body.