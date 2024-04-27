// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

//https://twitter.com/calyptus_web3/status/1772126269414531490
//What will `testEncodePackedMessages()` and `testEncodeMessages()` return in the `MessageEncodingTest` contract?

contract MessageEncodingTest {

    function testEncodePackedMessages() public pure returns (bool) {
        bytes memory packed1 = abi.encodePacked([10, 20], [30]);
        bytes memory packed2 = abi.encodePacked([10], [20, 30]);
        return keccak256(packed1) == keccak256(packed2);
    }

    function testEncodeMessages() public pure returns (bool) {
        bytes memory encoded1 = abi.encode([10, 20], [30]);
        bytes memory encoded2 = abi.encode([10], [20, 30]);
        return keccak256(encoded1) == keccak256(encoded2) ;
    }
// another example encoding:
    function testPacked() public pure returns (bool){
       bytes memory packed1 = abi.encodePacked("a", "bc");
       bytes memory packed2 = abi.encodePacked ("ab", "c");
       return keccak256(packed1) == keccak256 (packed2); // true
    }

    function testEncode() public pure returns (bool){
        bytes memory encoded1 = abi.encode("a", "bc");
        bytes memory encoded2 = abi.encode ("ab", "c");
        return keccak256 (encoded1) == keccak256(encoded2); // false
    }   
}     