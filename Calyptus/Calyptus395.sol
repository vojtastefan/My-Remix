// SPDX-License-Identifier:MIT
pragma solidity   ^0.8.26;

//https://x.com/CalyptusCareers/status/1802914182796390661

//Who does the pay function actually pay? 💰

contract PayCoinbase {    
    function pay() public payable {
        require(msg.value == 1 wei, "Must send exactly 1 wei");
        payable(block.coinbase).transfer(1 wei);
    }
}
/////////////////////////////////////////////////////////////////
/*It pays the address that mined the current block, in this case coinbase address.

block.coinbase is a global variable that represents the address of the miner 
who mined the block in which the current contract execution is included.
*/