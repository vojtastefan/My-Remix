// SPDX-License-Identifier:MIT
pragma solidity   ^0.8.20;

//https://x.com/CalyptusCareers/status/1804001302310978038
//Which of the following functions will use less gas and why? ⛽️
contract Calyptus397 {

    function whatIsMyNamel() external returns (string memory) {
        return "Attention is all you need!";
    }
            /*gas	24606 gas
            transaction cost	21396 gas 
            execution cost	332 gas 
            input	0xd38...27eea
            decoded input	{}
            decoded output	{"0": "bytes32: 0x417474656e74696f6e20697320616c6c20796f75206e65656421000000000000"}
            */

    function whatIsMyName2() external returns (bytes32) {
        return bytes32("Attention is all you need!");
     }
            /* gas	24931 gas
            transaction cost	21679 gas 
            execution cost	615 gas 
            input	0x91b...5f00f
            decoded input	{}
            decoded output	{"0": "string: Attention is all you need!"
        */
}
