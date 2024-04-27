// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

//https://twitter.com/calyptus_web3/status/1772930837509529987
//Can the consistencyCheck() function return false? 🤔

contract FinancialRecords {
    uint256 internal fundsStored;
    //receive() external payable { }

    function addFunds() public payable {
        fundsStored = fundsStored + msg.value;
    }

    function actualBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function recordedBalance() public view returns (uint256) {
        return fundsStored;
    }

    function consistencyCheck() public view returns (bool) {
        return actualBalance() == recordedBalance();
    }
}

contract HelperForCalyptus327{
    constructor() payable {
    }

    function selfKill(address _a) public {
        selfdestruct(payable(_a));
    }

    // function sendEth(address _b) public payable {
    //     (bool success, ) = _b.call{value:address(this).balance}("");
    //     require (success, "not success");}

    
}
