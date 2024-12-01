// SPDX-License-Identifier:MIT
pragma solidity >= 0.8.24;

//https://x.com/CalyptusCareers/status/1800377456680968565

//What will the callZeroAddress() function return? 🤔

contract CallDemo {

    function callZeroAddress() public returns(bool) {
    // Zero address (non-existent address)
    address zeroAddress = address(0);

    // Function signature for 'areYouThere()'
    bytes memory payload = abi.encodeWithSignature("areYouThere()");

    // Attempt to call the zero address with the function signature
    (bool success,) = zeroAddress.call(payload);

    //I Return the result of the call
    return success;
    }
}