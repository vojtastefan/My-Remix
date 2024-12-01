//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1848258021912105259
/*
Check out this commit reveal scheme implementation where, one party commits funds to another party 
and only the committed party can redeem the funds. Can you find vulnerabilities in the contract?
*/

contract SecureScheme {
    mapping (address => uint256) public balances;
    mapping (address => mapping(bytes32 => bool)) public orderCommits;

    event OrderCommitted(bytes32 indexed commit);
    event OrderFilled(address committer, address committed, uint256 amount, uint256 price);

    function deposit() external payable {
        balances[msg.sender] += msg.value;
    }

    function commitOrder(bytes32 commit)
    external {
        orderCommits[msg.sender][commit] = true;
        emit OrderCommitted(commit);
    }

    function fillOrder(address committer, address committed, uint256 amount, uint256 price) external {
        uint256 cost = amount * price;
        require (balances[committer] >= cost, "Insufficient balance of order placer");

        revealOrder(committer, committed, amount, price);

        balances[committer] -= cost;
        balances[committed] += cost;

        emit OrderFilled(committer, committed, amount, price);
    }

    function revealOrder(address committer, address committed, uint256 amount, uint256 price) internal view {
        bytes32 commit = keccak256(abi.encodePacked(committer, committed, amount, price));
        require(orderCommits[committer][commit], "Invalid commit");
    }
}

// This contract should delete the commit hash after it gets used once.
// Otherwise the caller of the fillOrder function can drain the balance of the committer.