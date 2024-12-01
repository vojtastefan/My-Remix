//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// https://x.com/calyptus_web3/status/1842089777476092153

// Have a look at the Multisig Authorization contract below 
// and tell us what's wrong with the executeAction() function.

contract MultisigAuth {
    struct AuthData {
        bytes digitalSignature;
        address signer;
        bytes32 actionHash;
    }

    // additional fields as needed

    // Other parts of the contract...
    function executeAction(AuthData[] calldata authorizations, bytes calldata operation) public {
        // Logic to prevent replay attacks remains here

        for (uint256 idx = 0; idx < authorizations.length; ++idx) {
            require(
                checkSignatureValidity(authorizations[idx].digitalSignature, authorizations[idx].signer),
                "Signature not valid"
            );
            require(allowedSigners[authorizations[idx].signer], "Signer not authorized");
        }
        performOperation(operation);
        // Additional functions and logic...
        }
}





