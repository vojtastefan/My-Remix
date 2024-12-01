// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1861320650595430453
// The below contract has a function that gets the location at which the balances mapping is stored. 
// Can you tell what will be the output if the getBalanceSlot() function is called?

contract StorageContract {
    uint constant code = 300;

    mapping(address => uint256) private balances;

    function getBalancesSlot()
        external
        pure
        returns (uint256){

        // get the location of the slot where the mapping is saved
        uint256 slot;

        assembly {
            slot := balances.slot
        }
        return (slot);
    }
}

////////////////////////////////////////////////////////////////////////

contract StorageContractB{

    uint public acode = 300;
     mapping(address => uint256) private balances;
    
    function getCodeSlot() external pure returns (uint256){

        // get the location of the slot where the uint public acode is saved
        uint256 slot;

        assembly {
            slot := acode.slot
            }
        return (slot);
    }
    function getBalancesSlot()
        external
        pure
        returns (uint256){

        // get the location of the slot where the mapping is saved
        uint256 slot;

        assembly {
            slot := balances.slot
        }
        return (slot);
    }
}

/*
uint constant code se not saved at slot 0
uint public acode is saved at slot 0
*/