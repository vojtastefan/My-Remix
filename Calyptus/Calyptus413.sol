// SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

//Which function in the given smart contract would you choose as a setter function, and why? 🧐

contract SetZeNumber {
    uint256 public number;
    error NotEnough();
    //error NotEnough(uint num, string message);

    function setNumber1(uint256 _number) public {
        require(_number > 10, "number too small please");
        number = _number;
    }

    function setNumber2(uint256 _number) public {
        if (_number < 10) {
            revert NotEnough();
            //revert NotEnough(_number, "try harder");
        }
        number = _number;
    }
}