// SPDX-License-Identifier:MIT
pragma solidity ^0.8.24;

//FestivalCoin's new smart contract allows fans to buy event tickets in batches.
//The dev team is proud, but the security auditor is suspicious.

//Can you spot the flaw? 🤔
// import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";

contract TicketingSystem is ERC1155, Ownable, ERC1155Supply {
    constructor() ERC1155("") {}

    error MaxSupplyReached();
    error InvalidPrice();

    mapping(uint256 => uint256) ticketsWithMaxSupply;
    mapping (uint256 => uint256) ticketsWithPrice;

    function buyTicketsBatch(
        address to,
        uint256[] calldata ids,
        uint256[] calldata quantities
    ) public payable {
        uint256 overallPrice;

        for (uint256 i; i < ids.length; ++i) {
            uint256 ticketQuantity = quantities[i];
            uint256 ticketId = ids[i];
    
            overallPrice += ticketsWithPrice[ticketId] * ticketQuantity;
        if (
            ERC1155Supply.totalSupply(ticketId) + ticketQuantity >
            ticketsWithMaxSupply[ticketId]
        ){
            revert MaxSupplyReached();
        }
        }
        if (msg.value != overallPrice) revert InvalidPrice();

         _mintBatch(to, ids, quantities, "");
    }
}