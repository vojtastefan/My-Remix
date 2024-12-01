//SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// Which of the following implicit conversions will throw an error?

contract Calyptus450 {
    uint8 variableA = 5;
    uint16 variableB = variableA;

    uint32 variableC = 5;
    uint256 variableD = variableC;

    int8 variableE = 5;
    uint256 variableF = variableE;

    uint16 variableG = 5;
    uint8 variableH = variableG;
}