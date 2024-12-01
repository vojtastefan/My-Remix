// SPDX-License-Identifier:MIT
pragma solidity   ^0.8.20;

//https://x.com/CalyptusCareers/status/1803703513970610512
//What are the potential security vulnerabilities in this smart contract?

contract MysticalVault {
    struct Signature {
        bytes32 hash;
        uint8 v;
        bytes32 r;
        bytes32 s;
    }

    mapping (bytes32 => bool) public lapsed;
    address owner = address(0xFACE);

    function redeem (Signature[] calldata sigs) public {
        for (uint i = 0; i < 4; i++) {
            Signature calldata sig = sigs[i];
        
        // Verify every signature
        require(
            owner == ecrecover (sig.hash, sig.v, sig.r, sig.s),
            "Invalid signature"
        );
        require(!lapsed[sig.hash], "signature lapsed");
        lapsed[sig.hash] = true;
        }
        payable(msg. sender). transfer(address(this).balance);
    }

    receive() external payable {}
    }