// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Event {
    event Log(string message, uint val);
    // Up to 3 parameters can be indexed
    event IndexedLog(address indexed sender, uint val);
    
    //1
    event Message(address indexed _from, address indexed _to, string _message);

    function examples() external {
        emit Log("Foo", 123);
        emit IndexedLog(msg.sender, 123);
    }
    
    //2
    function sendMessage(address _addr, string calldata _message) external {
        emit Message ( msg.sender, _addr, _message);
    }
}