// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//https://twitter.com/calyptus_web3/status/1763066642626466161

//When you call exampleFunction(), will it return the function selector of exampleFunction() or getFunctionSelector()?

contract FunctionSelectorExample {
    function getFunctionSelector() public pure returns (bytes4) {
    return msg.sig;
    }
    function exampleFunction() external pure returns(bytes4 selector){
    selector = getFunctionSelector();
    }
}