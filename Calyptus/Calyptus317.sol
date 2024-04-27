// SPDX-License-Identifier: MIT
pragma solidity >=0.8.20;

//https://twitter.com/calyptus_web3/status/1768140000460189862
//Examine the smart contract below 🔍
//Can you tell us whether invoking the moveToSlot0() function will return 1 or 2?


contract DoesWrite {

    struct Foo {
        uint256 bar;
    }
    Foo[] public myArray;

    constructor() {
    // Initialize array with dummy data
        myArray.push(Foo({bar: 1}));
        myArray.push(Foo({bar: 2}));
    }

    function moveToSlot() external returns (uint256) {
        Foo storage foo = myArray [0];
        foo = myArray[1];
        return myArray[0].bar;
    }    
}