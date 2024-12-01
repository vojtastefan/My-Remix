// SPDX-License-Identifier:MIT
pragma solidity  0.8.20;

//https://x.com/CalyptusCareers/status/1794216829474234704/photo/1
//Will the following smart contract compile? 🤔

contract MyContract {
    uint256 public data;

    function setData(uint256 _data) external {
        data = _data;
    }

    function setsDataToFive() public {
        setData(5);
        
    }
}
