
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*https://twitter.com/calyptus_web3/status/1767779377729700247
An address variable consumes 20 bytes of storage. 
Structs enable data grouping, reducing the need for multiple storage variables 💽 
Given this, what output do you expect when calling getValInHex() with an input of 2?
*/
contract AddressesInStorage {
    struct Addresses {
    address zero;
    address one;
    address two;
    }

    Addresses addresses = Addresses (
        0xd575b01d137bdD85658C8466C34CCbeacbE4cfD9,
        0x46789D62F8aFDd73602B1D5efA54be0A0f61d378,
        0xface73D17B7aD9895381B5941D553A73AC673B09
    );

    //Input is the storage slot that we want to read
    function getValInHex(uint256 y) external view returns (bytes32) {
        bytes32 x;
        assembly {
        // assign value of slot y to x
        x := sload(y)
    }
    return x;
    }
}