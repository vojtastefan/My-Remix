//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract BettingPlatform {
    enum Outcome { Win, Lose }
    mapping(address => uint256) public stakes;
    mapping (Outcome => uint256) public totalStakes;
    mapping(Outcome => mapping(address => uint256)) public winnings;

    uint256 public totalPool;

    // Custom Errors
    error AlreadyStaked();
    error NoBetAmount();
    error OutcomeAlreadyDecided();

    event BetPlaced(address indexed user, uint256 stakeAmount, Outcome outcome);
    event Payout(address indexed user, uint256 amount);

    function placeBet(Outcome outcome) external payable {
        uint256 stakeAmount = msg.value;
        if (stakes[msg.sender] > 0) revert AlreadyStaked();
        if (stakeAmount == 0) revert NoBetAmount();

        stakes[msg.sender] = stakeAmount;
        totalStakes[outcome] += stakeAmount;
        totalPool += stakeAmount;

        emit BetPlaced(msg.sender, stakeAmount, outcome);
    }

    function decideOutcome(Outcome outcome) external {
        if (totalStakes[outcome] == 0) revert OutcomeAlreadyDecided();

        for (uint8 i = 0; i < 2; i++) {
            if (Outcome(i) != outcome) {
                totalPool -= (totalStakes[Outcome(i)] * totalStakes[outcome]) / totalPool;
            }
        }

        uint256 winAmount = (stakes[msg.sender] * totalPool) / totalStakes[outcome];
        winnings[outcome][msg.sender] = winAmount;

        emit Payout(msg.sender, winAmount);
    }
    function withdrawwinnings() external {
        uint256 amount = winnings[Outcome.Win][msg.sender] + winnings[Outcome.Lose][msg.sender];
        payable(msg.sender).transfer(amount);
    }
}