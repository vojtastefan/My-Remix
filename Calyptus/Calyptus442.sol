// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// https://x.com/calyptus_web3/status/1838106174454968651
// Can the below contract be subject to a denial-of-service attack? If yes, how?

contract SensitiveList {
    address[] private addressList;
    address private admin;

    constructor (){
        admin = msg.sender;
    }

    function addItem(address item) public {
        addressList.push(item);
    }

    function removeAllItems() public {
        require(msg.sender == admin, "Only the admin can remove addresses");
        delete addressList;
    }

    function getItemCount() public view returns (uint256) {
        return addressList.length;
    }
}