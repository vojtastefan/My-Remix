// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//https://twitter.com/calyptus_web3/status/1779743687653605452

//This function aims to facilitate a swap between WETH and USDT 🔄
//What potential pitfalls should we be wary of?
contract Calyptus344{



function testswapTokensWithMaxDeadline() external payable {
    WETH.approve(address(UNISWAP_ROUTER), type(uint256).max);
    WETH.deposit{value: 1 ether}();

    uint256 amountIn = 1 ether;
    uint256 amountOutMin = 0;

    // Path for swapping ETH to USDT
    address[] memory path = new address[](2);
    path[0] = address(WETH); // WETH (wrapped Ether)
    path[1] = USDT; // USDT (Tether)

    IUniswapV2Router02(UNISWAP_ROUTER).swapExactTokensForTokens(
    amountIn,
    amountoutMin,
    path,
    address(this),
    type(uint256).max);

    console.log("USDT" , IERC20(USDT).balance0f(address(this)));
}
}
