
//https://x.com/CalyptusCareers/status/1801826998999764995
//Will the following contract compile? 🤔

pragma solidity 0.4.26;

contract A {
    function foo()  public pure returns (uint256) {
        {
            uint256 innerVariable = 1;
        }
        return innerVariable;
    }
}