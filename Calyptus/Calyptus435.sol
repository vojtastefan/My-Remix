// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// As a smart contract auditor,
// will you be comfortable with this function being in a contract you are auditing? 🔐

contract Calyptus435 {
    function safeTransfer(
        address token,
        address to,
        uint256 amount
    ) public {
        (bool success, ) = token.call(
            abi.encodeWithSignature("transfer(address,uint256)", to, amount)
        );
        require(success, "Transfer failed");
    }
}
