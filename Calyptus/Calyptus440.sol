// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// https://x.com/calyptus_web3/status/1836291583420846584
// What can go wrong with this airdrop smart-contract?

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Airdrop {
    ERC20 public token;
    address[] public users;

    constructor(address _tokenAddress, address[] memory _users){
        token = ERC20(_tokenAddress);
        users = _users;
    }

    function airdrop() public {
        for (uint256 i = 0; i <= users.length ; ++i) {
            token.transfer(users[i], 1 ether);
        }
    }
}