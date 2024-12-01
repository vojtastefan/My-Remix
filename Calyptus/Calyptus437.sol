// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
// https://x.com/calyptus_web3/status/1831622044976337121

/*
Do gaps in storage impact the deployment cost of a smart contract? 
Would the two smart contracts below have significantly different deployment costs? 🤔 
*/

contract Test {
    //  112235 gas
    // Sepolia at 0x75d489bd38dc6290983f533a904b57e43af38bc3
    uint256 a = 1;
    uint256[49] private __gap;
    uint256 b =2;
}

contract Test2{
    // 112235 gas
    // Sepolia at 0x37f51cd9d084a27ffa4bda7443d4e66c60c0e791
    uint256 a = 1;
    uint256 b =2;
}