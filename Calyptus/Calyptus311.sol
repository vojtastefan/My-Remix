// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

//https://twitter.com/calyptus_web3/status/1766328063560696169/photo/1
//Why does the given contract not compile? 🤔

library MyLibrary {
    function myFunction (uint256 a) external pure returns (uint256) {
    return a * 2;
    }
}

contract BaseContract {
    using MyLibrary for uint256;

    function useLibraryFunction1(uint256 a) public pure returns (uint256) {
        return a.myFunction();
    }
}
    
contract DerivedContract is BaseContract {

    function useLibraryFunction2(uint256 a) public pure returns (uint256) {
        
        return a.myFunction();
    }
}
