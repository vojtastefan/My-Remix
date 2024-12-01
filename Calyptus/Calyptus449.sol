//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1843901746604552240
// What would be the output if we call fetchHexValue() with the input value of 2?

contract StorageOfAddresses {
    struct AddrGroup {
        address first;
        address second;
        address third;
    }

    AddrGroup addrGroup =
        AddrGroup(
            0x9ACc1d6Aa9b846083E8a497A661853aaE07F0F00,
            0x5B38Da6a701c568545dCfcB03FcB875f56beddC4,
            0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
        );

    // Takes a storage slot number as input
    function fetchHexValue(uint256 slot) external view returns (bytes32) {
        bytes32 result;
        assembly {
            // retrieve the value from the specified storage slot
            result := sload(slot)
        }
        return result;
    }
}
// the third address