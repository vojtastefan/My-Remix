// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//https://twitter.com/calyptus_web3/status/1774647945737933268
//Take a look at this seemingly harmless transfer function! 👀

//Can you identify any potential issues that may be lurking in the code? 🔍
contract SafuTransfer {
    mapping(address => uint256) public _balances;

    function _transfer(
    address _from,
    address _to,
    uint256 _amount
    )
    external virtual {
    uint256 _fromBalance = _balances[_from] ;
    uint256 _toBalance = _balances[_to];

    unchecked {
    _balances[_from] = _fromBalance - _amount;
    _balances[_to] = _toBalance + _amount;
        }
    }
}    