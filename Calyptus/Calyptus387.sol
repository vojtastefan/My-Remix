// SPDX-License-Identifier:MIT
pragma solidity >= 0.8.24;

//https://x.com/CalyptusCareers/status/1798927873446998413
//Is the clearAll() function doing its job? If not, what might be wrong with it? 🔍

contract Mapping {
    mapping(uint => uint) public numberStore;
    uint[] public keys;

    function addNumber(uint key, uint value) public {
        numberStore[key] = value;
        keys.push(key);
    }
    function clearAll() public {
        for (uint i = 0; i < keys.length; i++) {
            delete numberStore[keys[i]];
        }
    }
}