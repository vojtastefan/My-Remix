// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1852206439659397162
// Can you find a way to manipulate this contract to create more than the MAX_PER_USER NFTs for yourself?
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract MaxMint721 is ERC721Enumerable {
    uint256 public MAX_PER_USER = 10;

    constructor() ERC721("ERC721", "ERC721") {}

    function mint(uint256 amount) external {
        require(balanceOf(msg.sender) + amount <= MAX_PER_USER, "exceed max per user");
        for (uint256 i = 0; i < amount; i++) {
            uint256 mintIndex = totalSupply();
            _safeMint(msg.sender, mintIndex);
        }
    }
}
