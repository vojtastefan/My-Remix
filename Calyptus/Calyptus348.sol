//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract UsingModifiers {
    uint256 public tresholdBalance = 1 ether;

    modifier hasEnoughBalance() {
        require(address(this).balance >= tresholdBalance, "Insufficient balance");
        _;
    }

    function deposit() external payable {}
    function stuff() public hasEnoughBalance {
    }
    function otherStuff() public hasEnoughBalance {
    // logic
    }
}

contract UsingFunctionCheck {
    uint256 public tresholdBalance = 1 ether;

    function checkBalance() internal view {
        require(address(this).balance >= tresholdBalance, "Insufficient balance");
    }

    function deposit() external payable {}
    function stuff() public {
        checkBalance();
        // logic
    }

    function otherStuff() public {
        checkBalance();
        // logic
    }
}