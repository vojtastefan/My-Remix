// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface AggregatorV3Interface {
    function latestRoundData()
        external
        view
        returns (
            // Round id the answer was created in
            uint80 roundId,
            // Answer - the price
            int256 answer,
            // Timestamp when the round started
            uint256 startedAt,
            // Timestamp when the round was updated
            uint256 updatedAt,
            // Legacy round id - no longer needed
            uint80 answeredInRound
        );
}

contract PriceOracle {
    // Chainlink price feed for ETH / USD
    address private constant ETH_USD =
        0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419;

    function getPrice() public view returns (uint256) {
        // Code
        (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        ) = AggregatorV3Interface(0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419).latestRoundData();
        require(answer >= 0 );
        require(updatedAt >= block.timestamp - 3 hours);
        return uint(answer) * 1e10;
    }
}