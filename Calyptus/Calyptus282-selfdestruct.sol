// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract EtherReceiver {
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendEth(address _add, uint256 _value) external payable {
        (bool success,) = _add.call{value: _value}("");
        require(success, "didn't send eth");
    }
}

contract Kill {
    constructor() payable {}

    function kill(address _addr) external payable {
        selfdestruct(payable(_addr));
    }

    function getB() external pure returns(uint){
        return 4343;
    }
}