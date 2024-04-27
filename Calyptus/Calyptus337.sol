// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

//https://twitter.com/calyptus_web3/status/1776822214295195929
//Could you pinpoint potential issues with the PaymentManager contract and offer suggestions for improvement? 🧐

contract PaymentManager {
    address owner;
    mapping(address => uint256) public balances;

    event PaymentSent(address to, uint256 amount);

    modifier onlyOwner (){
        require(msg.sender == owner, "Only the owner can execute this");
        _;
    }
    
    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {
        require(msg.value > 0, "No ether provided");
        balances[msg.sender] += msg.value;
    }

    function payMultiple(address[] memory recipients) external onlyOwner {
        for (uint256 i = 0; i < recipients.length; i++) {
            uint256 paymentAmount = balances[recipients[i]];
            require (address(this).balance >= paymentAmount,"Contract doesn't have enough funds");

            balances[recipients[i]] = 0;
            emit PaymentSent(recipients[i], paymentAmount);

            // Attempt to send the payment
            (bool success,) = recipients[i].call{value: paymentAmount}("");
            require (success, "Payment failed");
        }
     // how to insert recipients into remix
    // ["0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db","0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2","0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"]
    }
}
