// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1856615513767530659
// Identify what can go wrong with this payManager contract and how would you suggest rectifying the problem.

contract PaymentManager {
    address public owner;
    mapping (address => uint256) public balances;

    event PaymentSent(address to, uint256 amount);

    modifier onlyOwner(){
        require(msg.sender == owner, "Only the owner can execute this");
        _;
    }

    constructor(){
        owner = msg.sender;
    }

    function deposit() external payable {
        require(msg.value > 0, "No ether provided");
        balances[msg.sender] += msg.value;
    }

    function payMultiple(address[] memory recipients) external onlyOwner {
        for (uint256 i = 0; i < recipients.length; i++) {
            uint256 paymentAmount = balances[recipients [i]];
            require(address(this).balance >= paymentAmount, "Contract doesn't have enough funds");

            balances[recipients[i]] = 0;
            emit PaymentSent(recipients[i], paymentAmount);

            // Attempt to send the payment
            (bool success,) = recipients[i].call{value: paymentAmount}("");
            require(success, "Payment failed");
        }
    }
}


    