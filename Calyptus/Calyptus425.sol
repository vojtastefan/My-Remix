// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

//https://x.com/CalyptusCareers/status/1820671196590964923
// Our DocumentSignatureVerifier smart contract ensures authenticity & integrity in document approvals. 
// Can you spot any issues? 🤔

contract DocumentSignatureVerifier {
    function verifySignatureChain(bytes32[] memory sigChain, bytes32 rootSignature, bytes32 document) public pure returns (bool) {
        bytes32 computedSignature = document;
        for (uint256 i = 0; i < sigChain.length; i++) {
            computedSignature = keccak256(abi.encodePacked(sigChain[i], computedSignature)) ;
        }
        return computedSignature == rootSignature;
    }
}