// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

library Math {
    function max(uint256 x, uint256 y) internal pure returns (uint256) {
        return x >= y ? x : y;
    }

    function min(uint256 x, uint256 y) internal pure returns (uint256) {
        return x <= y ? x : y ;
    }
}

contract TestMath {
    function max(uint256 x, uint256 y) external pure returns (uint256) {
        return Math.max(x, y);
    }

    function min(uint256 x, uint256 y) external pure returns (uint256) {
        return Math.min(x,y);
    }
}

library ArrayLib {
    function find(uint256[] storage arr, uint256 x)
        internal
        view
        returns (uint256)
    {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }
        revert("not found");
    }

    function sum(uint256[] storage arr) internal view returns (uint256) {
        uint256 s;
        for(uint256 i = 0; i < arr.length; i++){
            s += arr[i];
        }
        return s;
        
    }
}

contract TestArray {
    using ArrayLib for uint256[];

    uint256[] public arr = [3, 2, 1];

    function find() external view {
        arr.find(2);
    }

    function sum() external view returns (uint256) {
        return arr.sum();
    }
}