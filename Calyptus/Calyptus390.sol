// SPDX-License-Identifier:MIT
pragma solidity >= 0.8.24;

//https://x.com/CalyptusCareers/status/1801150877165568505
//In the given smart contract, which of the two functions, g() or  h(), 
//will change the value of  x  when called through f()? 🤔

contract C {
    uint[20] x;

    function f() public {
        g(x);
        h(x);
    }

    function g(uint[20] memory y) internal pure {
        y[2] = 3;
    }

    function h(uint[20] storage y) internal {
        y[3] = 4;
    }
}
/////////////////////////////////////////////////////////////

contract Trying {
    uint[2] public x;

// set uint[2] x during deploynment
    constructor() {
    x[0] = 10;
    x[1] = 20;
    }
// set uint[2] x manually
    function setX(uint a, uint b) public {
        x[0] = a;
        x[1] = b;
    }

    function f() public  returns(uint[2] memory b){
        g(x);
        h(x);
        return b;
    }

    function g(uint[2] memory y) internal pure {
        y[1] = 33;
    }

    function h(uint[2] storage y) internal {
        y[0] = 44;
    }
}
contract Tryin2{
    uint[20] public x;

// set uint[2] x during deploynment
    constructor() {
    x[0] = 10;
    x[10] = 20;
    }
// set uint[2] x manually
    function setX(uint a, uint b) public {
        x[6] = a;
        x[1] = b;
    }

    function f() public  returns(uint[20] memory b){
        g(x);
        h(x);
        return b;
    }
    function g(uint[20] memory y) internal pure {
        y[7] = 33;
    }

    function h(uint[20] storage y) internal {
        y[19] = 44;
    }
}