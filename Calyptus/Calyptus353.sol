//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//Which of the following setter functions would you prefer and why? 🤔
contract ShortTypeGasExample {

    uint8[10] public shortValues;
    error ValueTooLarge();

    function setShortValues(uint8[10] calldata _values) public {
        for (uint8 i = 0; i < _values.length; i++) {
            shortValues[i] = _values[i];
        }
    }

    function setShortValues2(uint[10] calldata _values) public {
        for (uint8 i = 0; i < _values.length; i++) {
        uint _value = _values[i];
        if (_value > type(uint8).max) revert ValueTooLarge();
        uint8 value = uint8(_value);
        shortValues[i] = value;
        }
    }
}

