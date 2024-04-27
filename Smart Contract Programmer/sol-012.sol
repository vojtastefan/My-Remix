// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ForAndWhileLoops {
    function loop() external pure {
        // for loop
        for (uint i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                // pokud i == 3, přeskočí na i == 4
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                // tzn. loop končí s i == 4
                break;
            }
        }

        // while loop
        uint j;
        while (j < 10) {
            j++;
        }
    }

    function sum(uint _n) external pure returns (uint) {
        uint s;
        for (uint i = 1; i <= _n; i++) {
            s += i;
            
        }
        return s;
        
    }
    
}