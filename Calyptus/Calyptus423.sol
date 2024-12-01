//// SPDX-License-Identifier:MIT
pragma solidity ^0.8.24;

/*A DEX smart contract rounds token amounts for trading purposes (floor/ceil to nearest unit). 

What potential issue could arise with this implementation? 🧐
*/


contract DEXRounding {
    // Rounds a token amount down to the nearest tradable unit
    function floorToNearestTradableUnit(uint256 tokenAmount, uint256 tradableUnit) public pure returns (uint256) {
        return tokenAmount - (tokenAmount % tradableUnit);
    }

    // Rounds a token amount up to the nearest tradable unit
    function ceilToNearestTradableUnit(uint256 tokenAmount, uint256 tradableUnit) public pure returns (uint256) {
        if (tokenAmount % tradableUnit == 0) {
            return tokenAmount; // No rounding needed if it's already a multiple of tradableUnit
        }
        return tokenAmount - (tokenAmount % tradableUnit) + tradableUnit;
    }
}