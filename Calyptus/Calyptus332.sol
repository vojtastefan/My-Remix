// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//https://twitter.com/calyptus_web3/status/1775067413161169170
//Would you feel safe putting your funds in this contract? 🤔

contract Fund {
    mapping (address => uint) public shares;

    function withdraw() public {
        if (payable(msg. sender).send(shares [msg. sender])){
            shares[msg. sender] = 0;
            }
        }
}    