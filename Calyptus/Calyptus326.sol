// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

//https://twitter.com/calyptus_web3/status/1772488682605256876
//In the given smart contract, what happens if we:
//1️⃣ Call callUsingInterface(): Will it revert or go through?
//2️⃣ Call rawCall(): Will it revert or go through? What will be the state of success after the call?

interface ISomeInterface {
    function foo() external;
}    

contract LetsMakeCalls {
    bool public success;

    function callUsingInterface() external {
        ISomeInterface(tx.origin).foo();
    }

    function rawCall() external {
    (success, ) = tx.origin.call(abi.encodeWithSignature("foo()"));
    }
}