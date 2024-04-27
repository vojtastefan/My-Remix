// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

    /*The time lock contract ensures that funds are
    inaccessible until a specified release time.
    Only the designated beneficiary can withdraw
    funds after the release time has passed. 
    source: Bahloul Mubarik - LinkedIn */

contract TimeLock {

    event Withdrawal(address indexed beneficiary, uint256 amount);

    address public beneficiary;
    uint256 public releaseTime;

    constructor (address _beneficiary, uint256 _releaseTime) {
        require(_releaseTime > block.timestamp, "Release time must be in the future");
        beneficiary = _beneficiary;
        releaseTime = _releaseTime;
    }
    function withdraw() external {
        require(msg.sender == beneficiary, "only the beneficiary can withdraw");
        require(block. timestamp >= releaseTime, "Release time has not arrived yet");

        // Perform the withdrawal
        // (In a real contract, you may want to transfer funds instead of using a simple bool flag)
        payable(beneficiary).transfer(address(this).balance);

        emit Withdrawal(msg.sender, address(this).balance);
    }
    
}