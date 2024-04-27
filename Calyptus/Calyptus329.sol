// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

//https://twitter.com/calyptus_web3/status/1773938238232695271/photo/1
//Which of the lines from function g() will throw an error? 🚨

contract C {
    uint256 index;
    uint256 z;

    function f() public pure returns (uint256, bool, uint256) {
        return (7, true, 2);
    }

    function g() public {
        (uint256 x, , uint256 y) = f();
        (x, z) = (1, 2);
        (x, y) = (y, x);
        (index,,) = f();
    }
}