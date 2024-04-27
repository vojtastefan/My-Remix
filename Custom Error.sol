// SPDX-License-Identifier:MIT
pragma solidity >= 0.8.24;

import "hardhat/console.sol";

contract CustomError{
   error ExampleRevert();

   function revertWithError() public pure{
    if (false){
        revert ExampleRevert();
    }
   }

   function revertWithRequire() public pure{
    require(true, "not true!");
   }

}