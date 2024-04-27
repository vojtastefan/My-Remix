// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

//https://twitter.com/calyptus_web3/status/1765965709824139600
//The provided code is encountering compilation issues! 😥 
//Could you identify the reason(s) behind its failure without running it through the compiler?

contract CanNotCompile {
    struct Data{
    uint256 balance;
    bytes32 signature;}

    mapping (address => Data) userData;

    function deleteStruct() external {
        Data storage data = userData[msg. sender];
        delete data;
        
    }
}