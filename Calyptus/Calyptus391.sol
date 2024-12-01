// SPDX-License-Identifier:MIT
pragma solidity   0.4.26;

//https://x.com/CalyptusCareers/status/1801464619266969782
//Will this function compile with any version of the Solidity compiler? 
//What errors do you encounter with different compiler versions? 🧐

contract A {
    function minimalScoping() pure public returns(uint) {
        { uint same;
          same = 1;
        }

        {
          uint same;
          same = 3;
        }

        return same;
        }
}