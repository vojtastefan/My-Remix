// SPDX-License-Identifier:MIT
pragma solidity >= 0.8.24;

//https://x.com/CalyptusCareers/status/1796753567950250216

//As the owner of a magical vault, adventurers must pass a costly aura check to withdraw treasures 🏰 
//Between the two withdraw functions in the MagicalVault smart contract, which one gets your vote and why?

contract MagicalVault {
    mapping (address => uint256) public treasures;
        
    function depositTreasures(uint256 amount) external {
        treasures[msg.sender] += amount;
    }

    function magicalCheck(address adventurer) internal view returns (bool) {
        uint256 sum = 0;
        
        for (uint i = 0; i < treasures[adventurer]; i++) {
            sum += i;
        }       
        return sum % 2 == 0; // This is just a random condition
    }

    function withdraw1(uint256 amount) external {
        require (amount > 0 && magicalCheck(msg.sender), "Invalid amount or failed magical check");
        treasures[msg.sender] -= amount;
        // logic to transfer the withdrawn treasures to the adventurer ...
        
    }

      function withdraw2(uint256 amount) external {
        require (magicalCheck(msg.sender) && amount > 0  , "Invalid amount or failed magical check");
        treasures[msg.sender] -= amount;
        // logic to transfer the withdrawn treasures to the adventurer ...
    }
}