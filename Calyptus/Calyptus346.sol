// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//https://twitter.com/calyptus_web3/status/1780446109753610335
/*The cosmic miner is assigned with the task to mine 500 gems and return to the mother-ship 🛸

What's the catch? ⛏️ */

contract CosmicMiner {
    uint256 public gemCount;
    uint256 public maxGemCount = 500;

    // The cosmic miner will return to the mother-ship if this condition is not met.
    function checkMiningConditions(uint256 _gems) internal view returns (bool) {
        // Conditions: '_gems' must be greater than 0, and gemCount should not exceed maxGemCount.
        return _gems > 0 && gemCount + _gems <= maxGemCount;
    }

    function mineGems(uint256 _gems) external {
        // Check if conditions to mine the gems meet
        checkMiningConditions(_gems);
        
        //solution:
        //require(checkMiningConditions(_gems), "didnt met the mining conditions");

        // Logic to mine -gems number of gems //

        // Increment the gemCount by the given value
        gemCount += _gems;
    }
}
