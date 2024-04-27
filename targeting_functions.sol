// SPDX-License-Identifier: MIT
pragma solidity >= 0.8.20;
import "forge-std/console.sol";

contract A {
    uint sum;

    function storeSum(address b) external {
    (bool success, bytes memory returnData) = b.call(abi.encodeWithSignature("add(uint256,uint256)", 5, 10));
    require (success);
    console.logBytes(returnData);
    sum = abi.decode (returnData, (uint)); // take the returned "returnData" and decode it into uint data type
    console.log(sum);
    console.log(gasleft());
    }
}

contract B {

    fallback() external {
        console.logBytes4(msg.sig);
        console.logBytes(msg.data);

    }

    function add(uint x, uint y) external pure returns (uint) {
    return x + y;
    }
}    


