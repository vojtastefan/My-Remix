// SPDX-License-Identifier:MIT
pragma solidity >= 0.8.24;

//https://x.com/CalyptusCareers/status/1798565526316233195
//At what value of "depth" does the function revert and why? 🧐

contract Depth {
    function echo(uint depth) public {
    if (depth > 0) {
        this.echo(depth - 1);
        }
    }
}
//////////////////////////////////////////////
// answer: uint depth = 32 due to gas limit
// The function will revert at value depth = 32 due to the gas limit. 
// When the gas is manualy customized, the depth value can be increased.
