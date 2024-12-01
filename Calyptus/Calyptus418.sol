// SPDX-License-Identifier:MIT
pragma solidity ^0.8.24;

/*
This function promises to prune redundant nodes from the mighty Data branch, 
but for some reason it does not compile 🤔
Can you figure out why?
*/

contract Calyptus418{
    // function prune(bytes memory branch, uint start, uint end) external pure returns(bytes memory) {
    //     return branch[start: end];
    // }

    function prune_solution(bytes calldata branch, uint start, uint end) external pure returns(bytes memory) {
        return branch[start: end];
    }
}

///////////////////