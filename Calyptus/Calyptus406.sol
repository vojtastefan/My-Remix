// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

//What does such a configuration mean in an ERC20? 🤔

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NonTransferableERC20 is ERC20 {

    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}
    
    function decimals() public view override returns (uint8) {
     return 0;
    }
}