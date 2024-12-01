// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

/* https://x.com/CalyptusCareers/status/1807262795353743681

   Why would the following function not compile? 🚨
*/
contract Calyptus404 {
 
    function arithmeticShiftLeft (uint8 a, uint8 positions) external pure returns (uint8) {
        return a * (2 ** positions);
    }
}