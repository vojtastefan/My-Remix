// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//https://x.com/calyptus_web3/status/1857340288445861959
// Tell us what can potentially go wrong with this wallet contract?

contract Wallet {
    address creator;
    mapping(address => uint256) balances;

    constructor() {
        creator = msg.sender;
    }

    function deposit() public payable {
        assert(balances[msg.sender] + msg.value > balances[msg.sender]);
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(amount >= balances[msg.sender]);
        
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // In an emergency the owner can migrate all funds to a different address.
    function migrateTo(address to) public {
        require(creator == msg.sender);
        payable(to).transfer(address(this).balance);
    }
}
/*
0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2   2233wei
0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db    33445 wei
0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB   23122 wei

migrate to 0x1aE0EA34a72D944a8C7603FfB3eC30a6669E454C

*/
