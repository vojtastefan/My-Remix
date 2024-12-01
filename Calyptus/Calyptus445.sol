// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1840640232925868458
// What can go wrong with the following swap?

contract Exchange {
    uint256 private constant CONVERSION = 1e12;

    function swapDAIForUSDC(uint256 usdcAmount) external pure returns (uint256 a){
        uint256 daiToTake = usdcAmount / CONVERSION;
        conductSwap(daiToTake, usdcAmount) ;
    }
}