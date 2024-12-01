// SPDX-License-Identifier:MIT
pragma solidity  0.8.26;

// https://x.com/CalyptusCareers/status/1793205445294702620
//Once deployed, what potential issues could arise with this contract?
// Additionally, what steps would you take to ensure that it compiles successfully? 🤔

contract HashForEther {

    error NotAuthorized();

    function withdrawWinnings() public {
        // Winner if the last 8 hex characters of the address are 0.
        require(uint32(uint160(msg. sender)) == 0, NotAuthorized());
        _sendWinnings();
    }

    function _sendWinnings() external {
        payable(msg.sender).transfer(address(this).balance);
    }
}