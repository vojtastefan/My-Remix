//SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//Could you take a close look at this token swap contract and share any potential issues you identify? 

contract TokenSwap {
    IERC20 public token1;
    IERC20 public token2;
    uint256 public rate; // How many token2 for 1 token1

    constructor(address _token1, address _token2, uint256 _rate) {
        token1 = IERC20(_token1);
        token2 = IERC20(_token2);
        rate = _rate;
    }

    function swap(uint256 amount) external {
        require(token1.transferFrom(msg.sender, address(this), amount), "Transfer of tokeni failed");
        uint256 swapAmount = amount * rate;
        require(token2.transfer(msg.sender, swapAmount), "Transfer of token2 failed");
    }

    function withdraw(address token, uint256 amount) external payable {
        IERC20(token).transfer(msg.sender, amount);
    } 
}

contract Token1 is IERC20 {
    uint256 public totalSupply = 1000;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    string public name = "Token 1";
    string public symbol = "TOK1";
    uint8 public decimals = 18;

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address recipient, uint256 amount)
        external
        returns (bool)
    {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender,recipient,amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender,spender,amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount)
        external
        returns (bool)
    {
        balanceOf[sender] -= amount;
        allowance[sender][msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint256 amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    // function burn(uint256 amount) external {
    //     balanceOf[msg.sender] -= amount;
    //     totalSupply -= amount;
    //     emit Transfer(msg.sender, address(0), amount);
    // }
}

contract Token2 is IERC20 {
    uint256 public totalSupply = 1000;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    string public name = "Token 2";
    string public symbol = "TOK2";
    uint8 public decimals = 18;

    constructor() {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address recipient, uint256 amount)
        external
        returns (bool)
    {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender,recipient,amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender,spender,amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount)
        external
        returns (bool)
    {
        balanceOf[sender] -= amount;
        allowance[sender][msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function mint(uint256 amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    // function burn(uint256 amount) external {
    //     balanceOf[msg.sender] -= amount;
    //     totalSupply -= amount;
    //     emit Transfer(msg.sender, address(0), amount);
    // }
}

// withdraw function is not protected