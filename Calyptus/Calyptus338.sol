// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

//https://twitter.com/calyptus_web3/status/1777184600709587213
//Can you spot the vulnerability in the proxy contract setup provided and suggest a solution? 📜

// The base logic contract
contract BaseContractV1 {

    uint256 public count;
    address public owner;
    constructor() {
        owner = msg.sender;
    }
    function increment() external {
        require(msg.sender == owner, "Only owner can increment");
        count++;
    }
}

// The upgraded logic contract, intended to be used with a proxy.
contract BaseContractV2 {
    uint256 public count;
    address public owner;
    string public name;

    function increment() external {
        require(msg.sender == owner, "Only owner can increment");
        count += 2;
    }
    function setName(string memory _name) external {
        require(msg.sender == owner, "Only owner can set the name");
        name = _name;
    }
}