// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1838828289193885940
// Can the consistencyCheck() function return false?

contract FinancialRecords {
    uint256 internal fundsStored;

    function addFunds() public payable {
        fundsStored = fundsStored + msg.value;
    }

    function actualBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function recordedBalance() public view returns (uint256) {
        return fundsStored;
    }

    function consistencyCheck() public view returns (bool) {
        return actualBalance() == recordedBalance();
    }
}
