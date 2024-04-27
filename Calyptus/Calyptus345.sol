// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//https://twitter.com/calyptus_web3/status/1780167171269623811

//In today's quest, a druid enters a magical forest to converse with trees using a magic smart-contract 🌳✨
//However, a compilation issue hinders the druid-tree communication. Can you uncover the error and restore the mystical dialogue?

contract EnchantedForest {

    function whisper(bytes calldata spell) internal pure returns (string memory) {
        (string memory magicalWord) = abi.decode(spell, (string));
        return magicalWord;
    }

    function talkToTrees() external pure returns (string memory) {
        bytes memory spell = abi.encode("entmoot");
        string memory res = whisper(spell);
        return res;
    }
}    