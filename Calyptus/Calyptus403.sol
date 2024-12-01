// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

//https://x.com/CalyptusCareers/status/1806538038241116600
//How can Calyptus intern get the following smart contract to compile? 👨‍💻

    enum Status {Active, Inactive}
    
    struct MyStruct {
        Status status;
        address addr;
        uint256 amount;
    }

contract Demo {
        MyStruct [] public structs;

        // function setStructs(MyStruct[] calldata _structs) external {
        //     structs = _structs;
        // }

//////////////////////////////////////////////////////////////////////////////////////
        function setStructsSolution(MyStruct[] calldata _structs) external {
            // Clear the existing structs array
            delete structs;
            // Iterate over the calldata array and copy each element to storage
            for (uint256 i = 0; i < _structs.length; i++) {
                structs.push(_structs[i]);
            }
        }
}
