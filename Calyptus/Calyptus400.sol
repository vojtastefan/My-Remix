// SPDX-License-Identifier:MIT
pragma solidity   ^0.8.20;

//https://x.com/CalyptusCareers/status/1805088479069536645
//What will be the consequence of having such an ERC20 token? 🪙

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract NonTransferableERC20 is ERC20 {
    constructor (string memory name, string memory symbol) ERC20(name, symbol) {}

    function _update(
        address from,
        address to,
        uint256 value
        ) internal override{
    }
}