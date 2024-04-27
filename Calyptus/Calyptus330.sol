// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//https://twitter.com/calyptus_web3/status/1774285530991112320
//Determine the final state of the numbers array in the NumberTransformation contract
// following the execution of the transform function 👨‍💻

contract NumberTransformation {
    uint[2] public numbers;

    function transform() public {
        firstChange(numbers);
        secondChange(numbers);
    }

    function firstChange(uint[2] memory arr) internal {
        arr[1] = 3;
    }

    function secondChange(uint[2] storage arr) internal {
        arr[0] = 4;
    }
}