// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1859514616834912704
// Tell us if this debt pool should be deployed on or not

contract DebtPool {
    uint256 public aggregateDebt;
    uint256 public previousInterestAccrual;
    uint256 public tokenBalance;

    constructor() {
        aggregateDebt = 10000 * (10 ** 6); // Assume debt token is represented in 6 decimal places, Like USDC.
        previousInterestAccrual = block.timestamp - 1;
        tokenBalance = 500 * (10 ** 18); // Assuming token has 18 decimal places like Ether.
    }

    function calculateCurrentReward() public view returns (uint256 rewardAmount) {
        // Calculating the time difference since last interest accrual
        uint256 timeDifference = block.timestamp - previousInterestAccrual;

        // In case no time has passed since the last accrual, the reward is o
        if (timeDifference == 0) return 0;

        // Compute the reward based on time difference
        rewardAmount = (aggregateDebt * timeDifference) / (365 days * (10 ** 18));
        
        return rewardAmount;
    }
}