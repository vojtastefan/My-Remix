// SPDX-License-Identifier: MIT
pragma solidity >=0.8.20;

//https://twitter.com/calyptus_web3/status/1771763887513198730
//Pizza Challenge Alert! 🍕

//In the 'PizzaSliceComparison' contract, which function would you utilize for a more accurate assessment of the relative sizes of pizza slices, 
//and what rationale backs this choice?

contract PizzaSliceComparison {
    function compareSlices1 (
        uint256 sliceSize1,
        uint256 pizza1,
        uint256 sliceSize2,
        uint256 pizza2
    ) public pure returns (bool) {
        return sliceSize1 / pizza1 > sliceSize2 / pizza2;
    }   

    function compareSlices2(
        uint256 sliceSize1,
        uint256 pizza1,
        uint256 sliceSize2,
        uint256 pizza2)
    public pure returns (bool) {
        return sliceSize1 * pizza2 > sliceSize2 * pizza1;
    }
}    