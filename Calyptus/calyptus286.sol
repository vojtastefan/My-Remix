// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calyptus286{

function trim(string calldata str, uint start, uint end) external pure returns(string memory ) {
return str[start: end];
    }
}