// SPDX-License-Identifier:MIT
pragma solidity   ^0.8.20;

//https://x.com/CalyptusCareers/status/1804363723919765882

//Between the two functions provided, logArg1() and logArg2(), 
//which one will not compile and why? 🤔

contract TestStack {

    event LogValue(uint);

    function logArg1(uint al, uint a2, uint a3, uint a4,
        uint a5, uint a6, uint a7, uint a8,
        uint a9, uint a10, uint a11, uint a12,
        uint a13, uint a14, uint a15, uint a16
        ) public {
        emit LogValue(a16);
    }

   function logArg2(uint al, uint a2, uint a3, uint a4,
        uint a5, uint a6, uint a7, uint a8,
        uint a9, uint a10, uint a11, uint a12,
        uint a13, uint a14, uint a15, uint a16
        ) public {
        emit LogValue(a1);
   }
   

}
        