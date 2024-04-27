// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

//https://twitter.com/calyptus_web3/status/1778996574783205612
//UniswapV2Pair sends 1000 LP tokens to zero address. 
//What's the hidden meaning behind this move? 🤔

//I Snippet from the UniswapV2Pair Contract's mintO function
if (_totalSupply == 0) {
    liquidity = Math.sqrt(amount0.mul(amount1)).subMINIMUM_LIQUIDITY);
    _mint(address(O), MINIMUM_LIQUIDITY); // permanently lock the first MINIMUM_LIQUIDITY tokens
} else &
    liquidity = Math.min(
    amounto.mul(_totalSupply) / _reserve,
    amountl. mul(_totalSupply) / _reserve1
    );
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//https://github.com/Uniswap/v2-core/blob/master/contracts/UniswapV2Pair.sol
//the function from the original contract:

// this low-level function should be called from a contract which performs important safety checks
    function mint(address to) external lock returns (uint liquidity) {
        (uint112 _reserve0, uint112 _reserve1,) = getReserves(); // gas savings
        uint balance0 = IERC20(token0).balanceOf(address(this));
        uint balance1 = IERC20(token1).balanceOf(address(this));
        uint amount0 = balance0.sub(_reserve0);
        uint amount1 = balance1.sub(_reserve1);

        bool feeOn = _mintFee(_reserve0, _reserve1);
        uint _totalSupply = totalSupply; // gas savings, must be defined here since totalSupply can update in _mintFee
        if (_totalSupply == 0) {
            liquidity = Math.sqrt(amount0.mul(amount1)).sub(MINIMUM_LIQUIDITY);
           _mint(address(0), MINIMUM_LIQUIDITY); // permanently lock the first MINIMUM_LIQUIDITY tokens
        } else {
            liquidity = Math.min(amount0.mul(_totalSupply) / _reserve0, amount1.mul(_totalSupply) / _reserve1);
        }
        require(liquidity > 0, 'UniswapV2: INSUFFICIENT_LIQUIDITY_MINTED');
        _mint(to, liquidity);

        _update(balance0, balance1, _reserve0, _reserve1);
        if (feeOn) kLast = uint(reserve0).mul(reserve1); // reserve0 and reserve1 are up-to-date
        emit Mint(msg.sender, amount0, amount1);
    }