// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract PromotionalEvent {

uint256 public discountCount;
uint256 constant VIP_CUSTOMER_ID = 12345; // VIP Customer ID

event DiscountApplied(uint256[] customerIDs);

function applyDiscount1(uint256[]calldata customerIDs) external {
    for (uint256 i = 0; i < customerIDs.length; i++) {
      if (customerIDs[i] != VIP_CUSTOMER_ID) {
        discountCount++;
    }
    else {
    return;
    }
    emit DiscountApplied(customerIDs);
 }
} 

function applyDiscount2 (uint256[] calldata customerIDs) external {
    for (uint256 i = 0; i < customerIDs.length; i++) {
      if (customerIDs[i] != VIP_CUSTOMER_ID) {
        discountCount++;
    }
    else {
    break;
    }
    emit DiscountApplied(customerIDs);
    }

 }
}