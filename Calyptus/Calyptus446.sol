//I SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// https://x.com/calyptus_web3/status/1841365018266226767

/*
The TimedDrop contract is designed for token airdrops. 
Each time the airdrop function is called, this timer resets to another 30 days 
and the signer is cleared and ready for the next drop. 
The function is intended to mint 1000 tokens (the AIRDROP_AMOUNT) to the caller 
if the signature is verified. 
Tell us if you can break the logic and claim airdrops whenever you want.
*/

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TimedDrop is ERC20{
    address signer;
    uint256 timer = block.timestamp + 30 days;
    uint256 AIRDROP_AMOUNT = 1000;

    constructor() ERC20("MyToken", "MTK") {}

    function airdrop(address who, uint8 v, bytes32 r, bytes32 s) external {
        if (block.timestamp > timer) {
            signer = msg. sender;
        }

        require(signer == ecrecover(keccak256(abi.encode(who, AIRDROP_AMOUNT)), v, r, s), "invalid signature");

        _mint(msg.sender, AIRDROP_AMOUNT);

        timer = block.timestamp + 30 days;
        signer = address(0);
        }
    }
