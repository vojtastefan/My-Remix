//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Will calling the pullTrigger() function from the Trigger contract revert? If not, will it return 0 or 42?
// https://x.com/calyptus_web3/status/1846425758589153735

contract Bomb {
    uint256 public _code;

    constructor(uint256 code) {
        _code = code;
    }

    function blast() public {
        assembly {
            selfdestruct(0x0000000000000000000000000000)
        }
    }
}

contract Trigger {  
    function pullTrigger() public returns (uint256) {
        Bomb bomb = new Bomb(42);
        bomb.blast();
        return bomb._code();
    }
}