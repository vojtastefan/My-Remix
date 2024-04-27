//https://twitter.com/calyptus_web3/status/1778326297585889566
//Which set function will consume less gas - PoolDeployer1.set() or PoolDeployer2.set()? ⛽️

// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

struct Parameters {
    address factory;
    address token0;
    address token1;
    uint24 fee;
    int24 tickSpacing;
}

contract PoolDeployer1 {
    Parameters parameters;

    // 	174892 gas
    function set(address factory, address token0, address token1, uint24 fee, int24 tickSpacing) external {
        parameters = Parameters({factory: factory, token0: token0, token1: token1, fee: fee, tickSpacing: tickSpacing});

        delete parameters;
    }    
}

contract PoolDeployer2 {
    Parameters parameters;

    //	104691 gas
    function set(address factory, address token0, address token1, uint24 fee, int24 tickSpacing) external {
    parameters = Parameters({factory: factory, token0: token0, token1: token1, fee: fee, tickSpacing: tickSpacing});
    }
}
