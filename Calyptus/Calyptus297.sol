// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
contract FarmInventory {
    string[] public produce;

    constructor() {
        produce = new string[](0);
    }

    function addProduce(string calldata item) public {
        uint256 index = produce.length;
        produce[index] = item;
    }

    function howMuchProduce() public view returns (uint256) {
        return produce.length;
    }

    function updateProduceAt(uint rank, string calldata newItem) public {
        produce[rank] = newItem;
    }
}
