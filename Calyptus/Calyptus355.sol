//SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
//https://twitter.com/CalyptusCareers/status/1784069969468141638
//There seems to be an issue with the buyTicketsBatch() function. Can you pinpoint it? 🤔

contract TicketingSystem is ERC1155, Ownable, ERC1155Supply {
    constructor() ERC1155("") {}

    error MaxSupplyReached();
    error InvalidPrice();

    mapping (uint256 => uint256) ticketsWithMaxSupply;
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

    //// Overrides required by Solidity.
    ////