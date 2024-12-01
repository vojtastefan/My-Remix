// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

// The Tree Bard wants to find the maximum depth of his verse structure 🌳

// What flaw exists in his poetic function?

contract Calyptus433 {
    struct TreeNode {
        uint256 value;
        TreeNode left;
        TreeNode right;
    }

    function maxDepth(TreeNode memory root) public pure returns (uint256) {
        if (root.value == 0) return 0;
        return 1 + max(maxDepth(root.left), maxDepth(root.right));
    }

    function max(uint256 a, uint256 b) internal pure returns (uint256) {
        return a > b ? a : b;
    }
}
////////////////////////////////////////////////
///////////////   SOLUTION  ////////////////////
// if(root==null) return 0; is correct condition
// TypeError: Recursive struct definition