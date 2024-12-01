// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

/* https://x.com/CalyptusCareers/status/1806900434793075155

What will be the result of calling checkUninitializedSlot(), 
will it return 0 or throw an error? 🧐

*/

contract StorageDemo {
    uint256 public storedData;

    function set(uint256 x) public {
        storedData = x;
    }

    function get() public view returns (uint256) {
        return storedData;
    }

    function checkUninitializedSlot() public view returns (uint256){
        uint256 uninitializedSlotValue;
        assembly {
            uninitializedSlotValue := sload(1)
        }
        return uninitializedSlotValue;
    }
}