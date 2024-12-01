//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// https://x.com/calyptus_web3/status/1848975146230399007
// Checkout this lending and borrowing contract and tell us if you find anything sus.

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "@openzeppelin/contracts/utils/cryptography/MessageHashUtils.sol";

contract LendingPlatform {
    using ECDSA for bytes32;

    address payable public owner;
    mapping(address => uint256) public deposits;
    mapping(address => Loan) public loans;
    uint256 public lateFee = 0.01 ether;

    struct Loan {
        uint256 amount;
        uint256 dueDate;
    }

    function deposit() public payable {
        deposits[msg.sender] += msg.value;
    }

    function borrow(
        uint256 _amount,
        uint256 _duration,
        bytes memory _signature
    ) public {
        address borrower = _recoverSigner(
            _toEthSignedMessageHash(
                keccak256(abi.encodePacked(_amount, _duration))
            ),
            _signature
        );
        require(
            address(this).balance >= _amount,
            "Not enough funds in the contract"
        );
        require(loans[borrower].amount == 0, "previous loan not repaid");
        loans[msg.sender] = Loan(_amount, block.timestamp + _duration);
        payable(borrower).transfer(_amount);
    }

    function repayLoan(
        address _borrower,
        uint256 _amount,
        bytes memory _signature
    ) public payable {
        address borrower = _recoverSigner(
            _toEthSignedMessageHash(keccak256(abi.encodePacked(_amount))),
            _signature
        );
        require(borrower == _borrower, "Signature does not match borrower");
        require(loans[borrower].amount > 0, "No outstanding loans");
        uint256 repaymentAmount = loans[borrower].amount;
        bool isLate = block.timestamp > loans[borrower].dueDate;
        if (isLate) repaymentAmount += lateFee;
        require(msg.value >= repaymentAmount, "Insufficient repayment amount");
        if (msg.value > repaymentAmount) {
            deposits[borrower] += msg.value - repaymentAmount;
        }
        delete loans[borrower];
    }

    function _toEthSignedMessageHash(bytes32 _hash)
        internal
        pure
        returns (bytes32)
    {
        return _hash.toEthSignedMessageHash();
       
    }

    function _recoverSigner(
        bytes32 _ethSignedMessageHash,
        bytes memory _signature
    ) internal pure returns (address) {
        return _ethSignedMessageHash.recover(_signature);
    }
}
