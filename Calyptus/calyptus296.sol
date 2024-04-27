// SPDX-License-Identifier: MIT
pragma solidity >=0.8.19;

contract MyContract {
    address public owner;
    uint256 public immutable grant;

    constructor(address _owner, uint256 _value) {
        owner = _owner;
        
    }
}
