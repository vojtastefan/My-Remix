// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract LessonFour  {
    
    address public i_priceFeed = 0x694AA1769357215DE4FAC081bf1f309aDC325306;

    

    function getPrice() public view returns (uint256) {
        (, int256 price,,,) = AggregatorV3Interface(i_priceFeed).latestRoundData();
        return uint256(price);
    }

    function getDecimals() public view returns (uint8) {
        return AggregatorV3Interface(i_priceFeed).decimals();
    }

    function getPriceFeed() external view returns (address) {
        return i_priceFeed;
    }

}