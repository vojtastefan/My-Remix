// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1858792837489279253
// What would you change in the below price-feed consumer contract?
import "@chainlink/contracts/src/v0.8/interfaces/IAggregatorV3Interface.sol";

contract ChainlinkPriceConsumer {
    
    
    IAggregatorV3Interface public priceFeed;
    uint256 public price;

    constructor(address aggregatorAddress, uint256 _staleTime) {
        priceFeed = IAggregatorV3Interface(aggregatorAddress);
    }

    function updatePrice() external {
        (, int256 answer,,,) = priceFeed.latestRoundData();

        // Note: This should be done with caution and ensure the value is correctly cast to a uint.
        price = uint256(answer);
    }
}