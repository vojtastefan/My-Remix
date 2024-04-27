// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract DataLocations {
    // Data locations of state variables are storage
    uint public x;
    uint public arr;

    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    // Example of calldata inputs, memory output
    function examples(
        uint[] calldata y,
        string calldata s
    ) external returns (uint[] memory) {
        // Store a new MyStruct into storage
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        // Get reference of MyStruct stored in storage.
        MyStruct storage myStruct = myStructs[msg.sender];
        // Edit myStruct
        myStruct.text = "baz";

        // Initialize array of length 3 in memory
        uint[] memory memArr = new uint[](3);
        memArr[1] = 123;
        return memArr;
    }

    function set(address _addr, string calldata _text) external {
        // 1
        MyStruct storage prdel = myStructs[_addr];
        prdel.text = _text;
        
    }

    function get(address _addr) external view returns (string memory) {
        // 2
        //MyStruct storage prdel = myStructs[_addr];
        //return prdel.text;
        return myStructs[_addr].text;
        
    }
}