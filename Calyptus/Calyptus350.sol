//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*In a blockchain Treasure Hunt game,
the game master uses setTreasureLocation1 & setTreasureLocation2 to update the treasure's spot 🗺️
Both functions differ in implementation. Which is superior? Explain why 👇 */

contract TreasureHunt {
    address public gameMaster;
    uint256 public treasureLocation;

    constructor (){
        gameMaster = msg.sender;
    }

    function setTreasureLocation1(uint256 _newLocation) external {
        require(msg.sender == gameMaster, "Only the game master can set the treasure location");
        treasureLocation = _newLocation;
    }

    function setTreasureLocation2(uint256 _newLocation) external {
        treasureLocation = _newLocation;
        require(msg.sender == gameMaster,"Only the game master can set the treasure location");
    }
}
