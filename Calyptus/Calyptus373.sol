// SPDX-License-Identifier:MIT
pragma solidity >= 0.8.24;

//https://x.com/CalyptusCareers/status/1791695239347941761/photo/1

//We're about to walk the tightrope of UniswapV2 interactions 🔄 
//Will we gracefully balance our way to success, or end up loosing funds?

IUniswapRouterV2(SUSHI_ROUTER).swapExactTokensForTokens(
    quantity,
    0,
    correctPath,
    address(this)
    rightNow
);