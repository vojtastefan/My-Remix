// SPDX-License-Identifier:MIT
pragma solidity   ^0.8.26;

//https://x.com/CalyptusCareers/status/1802244215297941719
//Which of the two functions in CallerContract can change the value variable in StateChangingContract? 🔍

contract StateChangingContract {
    uint public value;
    address immutable DEPLOYER;

    constructor(){
        DEPLOYER = msg. sender;
    }

    function setValue(uint _value) public {
        if(msg.sender != DEPLOYER) revert();
        value = _value;
    }
}

contract CallerContract {
    StateChangingContract public stateChangingContract = new StateChangingContract();

    function foo(uint _value) public returns (bool, bytes memory) {
        (bool success, bytes memory data) = address(stateChangingContract).call(
            abi.encodeWithSignature("setValue(uint256)", _value)
        );
        return (success, data);
    }

    function bar(uint _value) public view returns (bool, bytes memory) {
    (bool success, bytes memory data) = address(stateChangingContract).staticcall(
            abi.encodeWithSignature("setValue(uint256)", _value)
        );
        return (success, data);
    }
}