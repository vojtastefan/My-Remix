// SPDX-License-Identifier: MIT
pragma solidity >=0.8.12 <0.9.0;

contract Lesson9 {
    function trying() external view returns (uint256) {
        uint256 correctAnswer = uint256(
            keccak256(
                abi.encodePacked(msg.sender, block.prevrandao, block.timestamp)
            )
        ) % 100000;
        return correctAnswer;
    }

    function sender() external view returns(address){
        return msg.sender;
    }

    function getPrevrandao() external view returns(uint256){
        return block.prevrandao;
    }
}