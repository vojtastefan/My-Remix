// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1862036232106025226

/*
BettingHelper is a helper smart contract in a Betting Dapp that enables the platform to calculate potential payouts 
based on provided odds.
The contract records betting transactions and issues events for each placed bet and corresponding payout, 
ensuring transparency and traceability of all operations on the blockchain. 

Tell us what can go wrong with the smart contract?
*/

contract BettingHelper {

    address public owner;

    // This event is emitted when a bet is placed
    event BetPlaced(address indexed bettor, uint8 betAmount, uint8 odds) ;

    // This event is emitted when a payout is made
    event Payout(address indexed bettor, uint256 payout);

    constructor() {
        owner = msg. sender;
    }

    // Function to place a bet
    function placeBet(uint8 betAmount, uint8 odds) external returns (uint256) {
        require(msg.sender == owner, "Only the owner contract can call this function");
        require (betAmount > 0, "Bet amount must be greater than 0");
        require(odds > 0, "Odds must be greater than 0");
    

        // Emit the event for a new bet
        emit BetPlaced(msg.sender, betAmount, odds);

        // Calculate the potential payout with the risk of overflow for uints
        uint256 potentialPayout = calculatePayout(betAmount, odds);

        // Emit the event for the payout
        emit Payout(msg.sender, potentialPayout);

        return potentialPayout;
    }

    // Function to calculate the payout
    function calculatePayout(uint8 betAmount, uint8 odds) internal pure returns (uint256){
        uint8 payout = betAmount * odds;
        return payout;
    }
}
   
    