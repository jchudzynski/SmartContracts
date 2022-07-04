// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Deflation is ERC20
{    
    uint256 denominator = 10000;
    uint256 numerator = 1500;

    constructor(string memory name, string memory symbol) ERC20(name,symbol) {
        uint256 initialSupply = 21000000*10**18;
        _mint(msg.sender, initialSupply);
    }

    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        uint256 fee = amount / denominator * numerator;
        uint256 valueToTransfer = amount - fee;
        super.transfer(to,valueToTransfer);
        _burn(msg.sender, fee);
        return true;   
    }
}