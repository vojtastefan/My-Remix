// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract NormalContract {
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

contract Caller {
    function setX(NormalContract _addr, uint _x) public returns(uint x){
        return x = _addr.setX(_x);
        //return NormalContract(_addr).setX(_x);
    }

    function setXFromAddress(address _addr, uint _x) public {
        NormalContract instance = NormalContract(_addr);
        instance.setX(_x);
        //NormalContract(_addr).setX(_x);
        //<nazev volaneho contractu>(adresa volaneho contractu).<nazev volane fce>(parametr volane fce)
    }

    function setXandSendEther(NormalContract _addressa, uint _x) public payable  {
       (uint x, uint value) = _addressa.setXandSendEther{value: msg.value}(_x);
    }
}
