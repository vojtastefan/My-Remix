// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; 

/* https://twitter.com/calyptus_web3/status/1762704190030155838
If we deploy FirstContract with the address of SecondContract as constructor argument and then call the firstCall() function,
 will the event fired have the caller or the FirstContract as msg.sender? */

contract FirstContract {
    address public secondContractAddress;

    constructor(address _secondContractAddress) {
        secondContractAddress = _secondContractAddress;
    }

    function firstCall() public {
        (bool success, ) = secondContractAddress.delegatecall(
        abi. encodeWithSignature("secondCall()"));
        require(success, "Delegate call to SecondContract failed");
    }
}

contract SecondContract {
    
    event Sender(address sender);

    function secondCall() public {
        emit Sender(msg. sender);
    }
}        