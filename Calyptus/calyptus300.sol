// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract A {

    uint256 public immutable value;

    constructor(uint256 _value) {
        value = _value;
    }

    function getValue() external view returns (uint256) {
        return value;
        }
}

contract B {

    uint256 public immutable value;
    address public implementation;

    constructor(address _implementation) {
        implementation =_implementation;
    }

    function getValue() external returns (uint256) {
        (bool success, bytes memory result) = implementation.delegatecall(abi. encodeWithSignature("getValue()"));
        require (success, "Delegatecall failed");
        return abi.decode(result, (uint256));
    }
}        